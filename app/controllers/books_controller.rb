class BooksController < ApplicationController
  def index
    @latest_books = Book.order(:created_at).group_by(&:isbn).first(3)
    @alpha_books = Book.order(:title).group_by(&:isbn)
    @alpha_books_key = @alpha_books.keys.paginate(:page => params[:page], :per_page => 4)
  end

  def borrowed
    @borrowed_books = Book.where({status: 'borrowed'})
    @users = User.all
  end

  def create
    isbn = params[:isbn]
    b = GoogleBooks.search(isbn).first
    if isbn.length == 13 && b != nil && b.title
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

  def show
    @book = Book.find params[:id]
    @books = Book.where({isbn: @book.isbn})
  end

  def deliver
    Book.find(params[:id]).update({status: 'borrowed'})
    Book.find(params[:id]).reservation.where({date_borrowed: nil}).first.update({date_borrowed: Time.now.to_s, date_due: (Date.today + 10).to_s})
    flash[:message] = "Delivery confirmed"
    redirect_to :back
  end

  def destroy
    book = Book.find params[:id]
    book.destroy
    flash[:message] = "Book Deleted"
    redirect_to books_path
  end

  def search
    search = params[:search]
    books = GoogleBooks.search(search).select {|item| item.isbn }

    @book_info = books.map do |b|
      if b.image_link || $gr_client.search_books(b.isbn_13).total_results == '0'
        {info: b, picture: b.image_link
        }
      else
        {info: b, picture: $gr_client.search_books(b.isbn_13).results.work.best_book.image_url
        }
      end
    end
    render 'users/dashboard'
  end

  private
  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publisher, :date_published, :description, :img_url, :stauts)
  end

end
