# frozen_string_literal: true

class BookPresenter
  extend Dry::Initializer

  option :book

  delegate :title, :author, :pages, to: :book

  def call
    info
  end

  def text
    "Книга: #{title}, Автор: #{author},  Страниц: #{pages || '-'}"
  end

  private

  def info
    @info ||= {
      title: title,
      author: author,
      pages: pages || '-'
    }
  end
end