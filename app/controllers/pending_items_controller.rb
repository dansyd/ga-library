class PendingItemsController < ApplicationController

  before_action :check_if_logged_in, :only => [:create, :destroy]

  def create
    pending_item = PendingItem.new
    pending_item.isbn = params['isbn']
    pending_item.user_id = @current_user.id
    pending_item.date_requested = DateTime.now
    if pending_item.save
      flash[:message] = 'Reservation request sent'
    else
      flash[:message] = 'An error occured'
    end
    redirect_to root_path
  end

  def destroy
    pending_item = PendingItem.find params[:format]
    pending_item.destroy
    user = User.find pending_item.user_id
    book = Book.where({isbn: pending_item.isbn}).first
    UserMailer.reservation_cancelled(user, book).deliver_now
    flash[:message] = "Request cancelled"
    redirect_to :back
  end

end
