# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes(
    :info,
    :summary
  )

  def info
    BookPresenter.new(book: object).call
  end

  def summary
    BookPresenter.new(book: object).text
  end
end