# frozen_string_literal: true

RSpec.describe CabifyChallenge::Actions::FreeAdjustment do
  describe '#compute' do
    subject do
      described_class.new(rate: 0.5,
                          group_quantity: 3,
                          affected_quantity: 2)
    end
    let(:product) { CabifyChallenge::Product.new(code: 'VOUCHER', price: 5.00) }
    let(:checkout) do
      CabifyChallenge::Checkout.new(pricing_rules: [])
    end
    context 'when it does not apply' do
      let(:line_item) do
        CabifyChallenge::LineItem.new(product: product, quantity: 2, checkout: checkout)
      end
      it 'returns zero' do
        expect(subject.compute(line_item)).to eq(0)
      end
    end
    context 'when it applies' do
      let(:line_item) do
        CabifyChallenge::LineItem.new(product: product, quantity: 3, checkout: checkout)
      end
      it 'returns amount to adjust' do
        expect(subject.compute(line_item)).to eq(-5)
      end
    end
  end
end
