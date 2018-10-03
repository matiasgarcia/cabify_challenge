# frozen_string_literal: true

require 'cabify_challenge/line_item'
require 'cabify_challenge/product'
require 'cabify_challenge/adjustment'

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
      @adjustments = []
    end

    def scan(code)
      product = PRODUCTS[code]
      raise 'Product does not exist' if product.nil?

      @cart[code] ||= ::CabifyChallenge::LineItem.new(product: product, checkout: self)
      @cart[code].add
    end

    def total
      @pricing_rules.each { |rule| rule.apply(@cart) }
      (total_without_adjustments + best_promotions_adjustments).round(2)
    end

    def add_adjustment(amount:, source:, line_item:)
      @adjustments << CabifyChallenge::Adjustment.new(amount: amount, source: source, line_item: line_item)
    end

    private

    def total_without_adjustments
      @cart.reduce(0) do |sum, (_product_code, line_item)|
        sum + line_item.total
      end
    end

    def best_promotions_adjustments
      @adjustments
        .group_by(&:line_item)
        .reduce(0) { |sum, (_source, adjustments)| sum + best_adjustment_amount(adjustments) }
    end

    def best_adjustment_amount(adjustments)
      adjustments.map(&:amount).min
    end
  end
end
