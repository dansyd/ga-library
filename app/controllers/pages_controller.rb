class PagesController < ApplicationController
  def index
    # isbn = params[:isbn]
    client = Goodreads::Client.new(api_key: "B9TgZYn2L64aiU19hRCbcA", api_secret: "edAr3fihaNqeLg1u7Fw0ii1CHhs9fhTo78Ehm16hoJk")
    # @book_info = client.book_by_isbn isbn
    @reservations = []
    Reservation.where({user: @current_user}).each do |reservation|
      @reservations.push([reservation.id, Book.where(id: reservation.book).first().title, reservation.date_borrowed])
    end
    @requests = Request.where({user: @current_user})
  end

  def send_message
    client = ApiAiRuby::Client.new(
      :client_access_token => '52cfb629bc354404b154e5c514f34123'
  )
  response = client.text_request 'hello!'
  result = response[:result]
  end

end
