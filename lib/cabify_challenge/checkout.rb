# frozen_string_literal: true

require 'cabify_challenge/line_item'

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

      @cart[product] ||= ::CabifyChallenge::LineItem.new(product: product)
      @cart[product].add
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
