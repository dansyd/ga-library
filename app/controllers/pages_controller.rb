class PagesController < ApplicationController
  def index
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
    if search
      if client.search_books(search).results.work.include?(:best_book)
        @book_info = client.search_books(search).results.work.best_book
      else
        @book_info = client.search_books(search).results.work.first().best_book
      end
    end
  end

  def create
    client = Goodreads::Client.new(api_key: "B9TgZYn2L64aiU19hRCbcA", api_secret: "edAr3fihaNqeLg1u7Fw0ii1CHhs9fhTo78Ehm16hoJk")
    @request = Request.create
    @request.update user_id: @current_user.id, isbn: client.book(params[:id]).isbn13
    redirect_to :root
  end

  private
  def request_params
    params.require(:request).permit(:user_id, :isbn)
  end
end
