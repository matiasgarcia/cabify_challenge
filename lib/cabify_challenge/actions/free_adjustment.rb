# frozen_string_literal: true

require 'cabify_challenge/actions/base_adjustment'

module CabifyChallenge
  module Actions
    class FreeAdjustment < BaseAdjustment
      def initialize(rate:, group_quantity:, affected_quantity:)
        @rate = rate
        @group_quantity = group_quantity
        @affected_quantity = affected_quantity
      end

      def compute(line_item)
        groups = (line_item.quantity / @group_quantity)
        - groups * line_item.product_price * @affected_quantity * @rate
      end
    end
  end
end
