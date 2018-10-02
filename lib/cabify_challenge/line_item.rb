# frozen_string_literal: true

module CabifyChallenge
  class LineItem
    attr_reader :product, :quantity

    def initialize(product:)
      @product = product
      @quantity = 0
    end

    def add
      @quantity += 1
    end

    def total
      ::CabifyChallenge::Checkout::PRODUCTS[product] * quantity
    end
  end
end
