# frozen_string_literal: true

module CabifyChallenge
  module Rules
    class BulkPurchase
      def initialize(quantity:, product:)
        @quantity = quantity
        @product = product
      end

      def apply?(cart)
        line_item = eligible_line_item(cart)
        line_item && line_item.quantity >= @quantity
      end

      def eligible_line_item(cart)
        cart[@product]
      end
    end
  end
end
