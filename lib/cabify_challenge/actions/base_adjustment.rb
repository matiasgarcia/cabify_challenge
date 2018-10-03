# frozen_string_literal: true

module CabifyChallenge
  module Actions
    class BaseAdjustment
      def perform(line_item, source)
        computed_amount = compute(line_item)
        return if computed_amount.zero?

        line_item.checkout.add_adjustment(amount: computed_amount,
                                          source: source,
                                          line_item: line_item)
      end

      def compute(_line_item)
        raise 'compute should be implemented in the sub class of Actions::BaseAdjustment'
      end
    end
  end
end
