class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    isbn = params[:isbn]
    b = GoogleBooks.search(isbn).first
    if isbn.length == 13 && b.title
      @book = Book.create({isbn: isbn,
                          title: b.title,
                          author: b.authors,
                          publisher: b.publisher,
                          date_published: b.published_date,
                          description: b.description,
                          img_url: b.image_link,
                          status: 'available'})
    else
      flash[:error] = "Invalid ISBN"
    end
    redirect_to :back
  end

  # def create
  #   book = Book.new book_params
  #   if search_check = @book_info
  #     song.save
  #     redirect_to book
  #   else
  #     flash[:error] = "Invalid ISBN"
  #     redirect_to new_book_path
  #   end
  # end

  def edit
    @book = Book.find params[:id]
  end

  def update
    book = Book.find params[:id]
    book.update book_params

    redirect_to book
  end

  def show
    @book = Book.find params[:id]
    @books = Book.where({isbn: @book.isbn})
  end

  def destroy
    book = Book.find params[:id]
    book.destroy
    redirect_to books_path
  end

  def search
    isbn = params[:isbn]
    client = Goodreads::Client.new(api_key: "B9TgZYn2L64aiU19hRCbcA", api_secret: "edAr3fihaNqeLg1u7Fw0ii1CHhs9fhTo78Ehm16hoJk")
    @book_info = client.book_by_isbn isbn
  end

  private
  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publisher, :date_published, :description, :img_url, :stauts)
  end

end
