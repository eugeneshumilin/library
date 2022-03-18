# frozen_string_literal: true

class BookContract < Dry::Validation::Contract
  params do
    required(:title).value(:string)
    required(:author).value(:string)
    optional(:pages).value(:integer)
  end

  rule(:pages) do
    key.failure('must be greater than 0') if value <= 0
  end
end