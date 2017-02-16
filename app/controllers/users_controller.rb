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
    @user = @current_user
  end

  def update
    user = @current_user
    if user.authenticate(params[:user][:current_password])
      user.update user_params
      redirect_to root_path
    else
      if params[:user][:current_password] == ""
        flash[:error] = "Please Enter the Current Password"
      else
        flash[:error] = "Incorrect Password"
      end
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :class, :email, :password, :password_confirmation)
  end

end
