# frozen_string_literal: true

module CabifyChallenge
  module Actions
    class BaseAdjustment
      def compute(_line_item)
        raise 'compute should be implemented in the sub class of Actions::BaseAdjustment'
      end
    end
  end
end
