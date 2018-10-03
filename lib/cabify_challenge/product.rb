# frozen_string_literal: true

module CabifyChallenge
  class Product
    attr_reader :code, :price

    def initialize(code:, price: 0)
      @code = code
      @price = price
    end
  end
end
