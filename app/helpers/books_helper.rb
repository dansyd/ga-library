module BooksHelper

  def available_books(books_array)
    books_array.select{ |book| book.status == 'available'}
  end

end
