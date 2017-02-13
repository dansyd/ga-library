module BooksHelper

  def available_books(books_array)
    books_array.select{ |book| book.status == 'available'}
  end

  def sort_books_by_status(books)
    books.sort_by &:status
  end

end
