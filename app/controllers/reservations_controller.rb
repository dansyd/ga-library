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

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :book_id, :date_requested)
  end

end
