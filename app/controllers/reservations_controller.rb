class ReservationsController < ApplicationController

  def create
    reservation = Reservation.create({book_id: params[:book_id],
                                      user_id: @current_user.id,
                                      date_requested: Date.today.to_s })
    book = Book.find params[:book_id]
    book.status = 'reserved'
    book.save
    flash[:message] = "Reservation made (See me in Reservations#create)"
    redirect_to root_path
  end

  def return
    isbn = Book.find(params[:id]).isbn
    next_item = PendingItem.where({isbn: isbn}).order(:date_requested)[0]
    # loop through waitlist with isbn
    # get 1st by date
    # create reservation with book_id, user_id, dates
    # remove item from waitlist
    if next_item
      Reservation.create({book_id: params[:id], user_id: next_item.user_id, date_requested: next_item.date_requested})
      Book.find(params[:id]).update({status: 'reserved'})
      PendingItem.find(next_item.id).destroy
    else
      Book.find(params[:id]).update({status: 'available'})
    end
    flash[:message] = "Return Confirmed (See me in Reservations#return)"
    redirect_to :back
  end

  def destroy
    reservation = Reservation.find params[:id]
    reservation.destroy

    isbn = Book.find(reservation.book_id).isbn
    next_item = PendingItem.where({isbn: isbn}).order(:date_requested)[0]

    if next_item
      Reservation.create({book_id: reservation.book_id, user_id: next_item.user_id, date_requested: next_item.date_requested})
      Book.find(reservation.book_id).update({status: 'reserved'})
      PendingItem.find(next_item.id).destroy
    else
      Book.find(reservation.book_id).update({status: 'available'})
    end
    flash[:message] = "Deletion Confirmed (See me in Reservations#destroy)"
    redirect_to :back
  end

end
