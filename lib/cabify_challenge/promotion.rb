# frozen_string_literal: true

module CabifyChallenge
  class Promotion
    def initialize(rule:, action:)
      @rule = rule
      @action = action
    end

    def apply(cart)
      return 0 unless @rule.apply?(cart)

      @action.perform(@rule.eligible_line_item(cart), self)
    end
  end
end
