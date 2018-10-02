# frozen_string_literal: true

require 'cabify_challenge/actions/base_adjustment'

module CabifyChallenge
  module Actions
    class ItemTotalAdjustment < BaseAdjustment
      def initialize(rate:)
        @rate = rate
      end

      def compute(line_item)
        line_item.total * @rate * -1
      end
    end
  end
end
