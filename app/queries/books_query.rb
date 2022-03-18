# frozen_string_literal: true

class BooksQuery
  def initialize(books = Book.all)
    @books = books
  end

  def with_pages
    @books.where.not(pages: nil)
  end
end