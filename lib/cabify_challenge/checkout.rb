# frozen_string_literal: true

module CabifyChallenge
  class Checkout
    PRODUCTS = {
      'VOUCHER' => 5.00,
      'TSHIRT' => 20.00,
      'MUG' => 7.50
    }.freeze

    def initialize(pricing_rules)
      @pricing_rules = pricing_rules
      @cart = {}
    end

    def scan(product)
      raise 'Product does not exist' if PRODUCTS[product].nil?

      @cart[product] ||= 0
      @cart[product] += 1
    end

    def total
      @cart.reduce(0) do |sum, (product_code, quantity)|
        sum + PRODUCTS[product_code] * quantity
      end
    end
  end
end
