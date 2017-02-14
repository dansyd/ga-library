class UsersController < ApplicationController

  before_action :check_if_logged_in, :only => [:edit, :update]
  before_action :check_if_admin, :only => [:index, :borrowed, :wishlist]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def dashboard
    @books = Book.all
    @reserved_books = Book.where({status: 'reserved'})
    @users = User.all
    @waitlist = PendingItem.all
    @student_waitlist = PendingItem.where({user_id: @current_user.id})
    @requests = Request.all.map do |r|
      {info: GoogleBooks.search(r.isbn).first, id: r.id, isbn: r.isbn}
    end
  end

  def search
    search = params[:search]
    @book_info = GoogleBooks.search(search).map do |b|
      if b.image_link || $gr_client.search_books(b.isbn_13).total_results == '0'
        {info: b, picture: b.image_link
        }
      else
        {info: b, picture: $gr_client.search_books(b.isbn_13).results.work.best_book.image_url
        }
      end
    end
    # if $gr_client.search_books(search).results.work.include?(:best_book)
    #   w = $gr_client.search_books(search).results.work
    #   w.best_book.description = $gr_client.book(w.best_book.id).description
    #   @book_info.push(w.best_book)
    # else
    #   $gr_client.search_books(search).results.work.each do |w|
    #     w.best_book.description = $gr_client.book(w.best_book.id).description
    #     @book_info.push(w.best_book)
    #   end
    # end
    render :dashboard
  end

  def make_request
    @request = Request.create(user_id: @current_user.id, isbn: params[:isbn])
    redirect_to dashboard_path
  end

  def cancel_request
    @request = Request.find(params[:id]).destroy
    redirect_to dashboard_path
  end

  def borrowed
    @borrowed_books = Book.where({status: 'borrowed'})
    @users = User.all
  end

  def deliver
    Book.find(params[:id]).update({status: 'borrowed'})
    Book.find(params[:id]).reservation.where({date_borrowed: nil}).first.update({date_borrowed: Time.now.to_s, date_due: (Date.today + 10).to_s})
    redirect_to :back
  end

  def wishlist
    @wishlist = Favorite.all.map do |f|
      {info: GoogleBooks.search(f.isbn).first, id: f.id}
    end
  end

  def add_to_wishlist
    Favorite.create(isbn: params[:isbn])
    Request.find(params[:id]).destroy
    redirect_to :back
  end

  def cancel_favorite
    Favorite.find(params[:id]).destroy
    redirect_to :back
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:create] = "Account created successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    check_if_logged_in
    @user = @current_user
  end

  def update
    user = @current_user
    user.update user_params
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :class, :email, :password, :password_confirmation)
  end

end
