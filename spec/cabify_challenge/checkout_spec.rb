# frozen_string_literal: true

RSpec.describe CabifyChallenge::Checkout do
  describe '#scan' do
    subject { described_class.new([]) }
    context 'when invalid product given' do
      let(:product) { 'FAKE' }
      it 'raises an error' do
        expect { subject.scan(product) }.to raise_error(/Product does not exist/)
      end
    end
    context 'when valid product given' do
      let(:product) { 'VOUCHER' }
      it 'returns quantity of products in cart' do
        expect(subject.scan(product)).to eq(1)
      end
    end
  end
  describe '#total' do
    context 'when no pricing rules given' do
      subject { described_class.new([]) }
      before do
        subject.scan('VOUCHER')
        subject.scan('VOUCHER')
        subject.scan('MUG')
      end
      it 'returns total amount without promotion adjustments' do
        expect(subject.total).to eq(17.50)
      end
    end
    context 'when pricing rules given' do
      context 'like buy 3 get 2 free' do
        let(:pricing_rules) do
          [
            CabifyChallenge::Promotion
              .new(
                rule: CabifyChallenge::Rules::GroupPurchase.new(quantity: 3, product: 'TSHIRT'),
                action: CabifyChallenge::Actions::FreeAdjustment.new(group_quantity: 3,
                                                                     affected_quantity: 2,
                                                                     rate: 1)
              )
          ]
        end
        subject { described_class.new(pricing_rules) }
        context 'and they apply' do
          before do
            subject.scan('TSHIRT')
            subject.scan('TSHIRT')
            subject.scan('TSHIRT')
          end
          it 'returns total with promotion adjustments' do
            expect(subject.total).to eq(20)
          end
        end
      end
      context 'like buy 3 or more' do
        let(:pricing_rules) do
          [
            CabifyChallenge::Promotion
              .new(
                rule: CabifyChallenge::Rules::BulkPurchase.new(quantity: 3, product: 'TSHIRT'),
                action: CabifyChallenge::Actions::ItemTotalAdjustment.new(rate: 0.05)
              )
          ]
        end
        subject { described_class.new(pricing_rules) }
        context 'and they apply' do
          before do
            subject.scan('TSHIRT')
            subject.scan('TSHIRT')
            subject.scan('TSHIRT')
          end
          it 'returns total with promotion adjustments' do
            expect(subject.total).to eq(57.00)
          end
        end
        context 'and none apply' do
          before do
            subject.scan('VOUCHER')
          end
          it 'returns total without promotion adjustments' do
            expect(subject.total).to eq(5.00)
          end
        end
      end
    end
  end
end
