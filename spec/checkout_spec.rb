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
end
