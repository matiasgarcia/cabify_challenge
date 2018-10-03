# !/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'cabify_challenge'

PRICING_RULES = [
  CabifyChallenge::Promotion
    .new(
      rule: CabifyChallenge::Rules::GroupPurchase.new(quantity: 2, product: 'VOUCHER'),
      action: CabifyChallenge::Actions::FreeAdjustment.new(group_quantity: 2,
                                                           affected_quantity: 1,
                                                           rate: 1)
    ),
  CabifyChallenge::Promotion
    .new(
      rule: CabifyChallenge::Rules::BulkPurchase.new(quantity: 3, product: 'TSHIRT'),
      action: CabifyChallenge::Actions::ItemTotalAdjustment.new(rate: 0.05)
    )
].freeze

checkout = CabifyChallenge::Checkout.new(PRICING_RULES)
ARGV.each { |product| checkout.scan(product.upcase) }
puts "Total: #{checkout.total}"
