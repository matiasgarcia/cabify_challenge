# frozen_string_literal: true

require 'cabify_challenge/line_item'
require 'cabify_challenge/product'

module CabifyChallenge
  class Checkout
    PRODUCTS = {
      'VOUCHER' => CabifyChallenge::Product.new(code: 'VOUCHER', price: 5.00),
      'TSHIRT' => CabifyChallenge::Product.new(code: 'TSHIRT', price: 20.00),
      'MUG' => CabifyChallenge::Product.new(code: 'MUG', price: 7.50)
    }.freeze

    def initialize(pricing_rules)
      @pricing_rules = pricing_rules
      @cart = {}
    end

    def scan(code)
      product = PRODUCTS[code]
      raise 'Product does not exist' if product.nil?

      @cart[code] ||= ::CabifyChallenge::LineItem.new(product: product)
      @cart[code].add
    end

    def total
      (total_without_adjustments + adjustments_total).round(2)
    end

    private

    def total_without_adjustments
      @cart.reduce(0) do |sum, (_product_code, line_item)|
        sum + line_item.total
      end
    end

    def adjustments_total
      @pricing_rules.reduce(0) do |sum, pricing_rule|
        sum + pricing_rule.apply(@cart)
      end
    end
  end
end
