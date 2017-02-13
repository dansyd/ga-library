class ReservationsController < ApplicationController

  def create
    reservation = Reservation.new reservation_params
    book = Book.find params[:reservation][:book_id]
    book.status = 'reserved'
    book.save
    if reservation.save
      flash[:create] = "Reservation created successfully"
    else
      flash[:error] = "There was an error"
    end
    redirect_to root_path
  end

  def return
    isbn = Book.find(params[:id]).isbn
    next_item = PendingItem.where({isbn: isbn}).order(:created_at)[0]
    # loop through waitlist with isbn
    # get 1st by date
    # create reservation with book_id, user_id, dates
    # remove item from waitlist
    if next_item
      Reservation.create({book_id: params[:id], user_id: next_item.user_id, date_requested: Date.today.to_s})
      Book.find(params[:id]).update({status: 'reserved'})
      PendingItem.find(next_item.id).destroy
    else
      Book.find(params[:id]).update({status: 'available'})
    end
    redirect_to :back
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :book_id, :date_requested)
  end

end
