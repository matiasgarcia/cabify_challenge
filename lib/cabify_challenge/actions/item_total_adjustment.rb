# frozen_string_literal: true

module CabifyChallenge
  module Actions
    class ItemTotalAdjustment
      def initialize(rate:)
        @rate = rate
      end

      def compute(line_item)
        line_item.total * @rate * -1
      end
    end
  end
end
