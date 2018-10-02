# frozen_string_literal: true

require 'cabify_challenge/rules/base_rule'

module CabifyChallenge
  module Rules
    class GroupPurchase < BaseRule
      def initialize(quantity:, product:)
        @quantity = quantity
        @product = product
      end

      def apply?(cart)
        line_item = eligible_line_item(cart)
        line_item && line_item.quantity / @quantity >= 1
      end
    end
  end
end
