class PendingItemsController < ApplicationController

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
    book = PendingItem.find params[:format]
    book.destroy
    redirect_to :back
  end

end
