# frozen_string_literal: true

module CabifyChallenge
  class LineItem
    attr_reader :product, :quantity, :checkout

    def initialize(product:, quantity: 0, checkout:)
      @product = product
      @quantity = quantity
      @checkout = checkout
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
