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
  end

  def search
    search = params[:search]
    @book_info = {}

    if $gr_client.search_books(search).results.work.include?(:best_book)
      @book_info = $gr_client.search_books(search).results.work.best_book
    else
      @book_info = $gr_client.search_books(search).results.work.first().best_book
    end

    render :dashboard
  end

  def make_request
    @request = Request.create(user_id: @current_user.id, isbn: $gr_client.book(params[:id]).isbn13)
    redirect_to dashboard_path
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

end
