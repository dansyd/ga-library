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
    client = Goodreads::Client.new(api_key: "B9TgZYn2L64aiU19hRCbcA", api_secret: "edAr3fihaNqeLg1u7Fw0ii1CHhs9fhTo78Ehm16hoJk")

    @borrowed_books = []
    Reservation.where({user: @current_user}).each do |reservation|
      @borrowed_books.push([Book.where(id: reservation.book).first().title, reservation.date_due])
    end

    @requests = []
    Request.where({user: @current_user}).each do |request|
      @requests.push(client.book_by_isbn(request.isbn).title)
    end

    search = params[:search]
    # ask joel
    @book_info = {:id => nil}
    if search
      if client.search_books(search).results.work.include?(:best_book)
        @book_info = client.search_books(search).results.work.best_book
      else
        @book_info = client.search_books(search).results.work.first().best_book
      end
    end
  end

  def request
    client = Goodreads::Client.new(api_key: "B9TgZYn2L64aiU19hRCbcA", api_secret: "edAr3fihaNqeLg1u7Fw0ii1CHhs9fhTo78Ehm16hoJk")
    @request = Request.create
    @request.update user_id: @current_user.id, isbn: client.book(params[:id]).isbn13
    redirect_to :root
  end

  def borrowed
    @users = User.all
  end

  def wishlist

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

  def request_params
    params.require(:request).permit(:user_id, :isbn)
  end

end
