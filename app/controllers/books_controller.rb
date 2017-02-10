class BooksController < ApplicationController
  def search
    isbn = params[:isbn]
    client = Goodreads::Client.new(api_key: "B9TgZYn2L64aiU19hRCbcA", api_secret: "edAr3fihaNqeLg1u7Fw0ii1CHhs9fhTo78Ehm16hoJk")
    @book_info = client.book_by_isbn isbn
  end
end
