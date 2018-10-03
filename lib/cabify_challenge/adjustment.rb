# frozen_string_literal: true

module CabifyChallenge
  class Adjustment
    attr_reader :amount, :source, :line_item

    def initialize(amount:, source:, line_item:)
      @amount = amount
      @source = source
      @line_item = line_item
    end
  end
end
