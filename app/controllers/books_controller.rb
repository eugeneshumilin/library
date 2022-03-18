# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, :validate_params, only: %i[show update destroy]
  before_action :validate_params, only: %i[create update]

  def index
    books = BooksQuery.new.with_pages

    render(json: books, each_serializer: BookSerializer)
  end

  def create
    book = Book.create!(book_params)

    render json: book, serializer: BookSerializer
  end

  def show
    render json: @book, serializer: BookSerializer
  end

  def update
    @book.update!(book_params)

    render json: @book, serializer: BookSerializer
  end

  def destroy
    @book.destroy

    head :no_content
  end

  private

  def book_params
    params.permit(:title, :author, :pages)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def validate_params
    contract = BookContract.new.call(book_params.to_h)

    raise InvalidParametersError if contract.failure?
  end
end
