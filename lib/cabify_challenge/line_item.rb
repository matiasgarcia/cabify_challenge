# frozen_string_literal: true

module CabifyChallenge
  class LineItem
    attr_reader :product, :quantity

    def initialize(product:, quantity: 0)
      @product = product
      @quantity = quantity
    end

    def add
      @quantity += 1
    end

    def total
      product_price * quantity
    end

    def product_price
      @product.price
    end
  end
end
