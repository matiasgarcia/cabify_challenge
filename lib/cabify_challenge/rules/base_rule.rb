# frozen_string_literal: true

module CabifyChallenge
  module Rules
    class BaseRule
      def eligible_line_item(cart)
        cart[@product]
      end

      def apply?(_cart)
        raise 'apply? should be implemented in the sub class of Rules::BaseRule'
      end
    end
  end
end
