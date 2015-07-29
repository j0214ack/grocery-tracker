require 'rails_helper'

describe Grocery do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of :count }
  it { is_expected.to validate_presence_of :exp_date }

  describe '#quantity' do
    it 'shows the counting and the unit of the item' do
      item = Fabricate(:grocery, count: 1, unit: 'L')

      expect(item.quantity).to eq '1 L'
    end
  end

  describe '#show_exp_date' do
    it 'formats like 07/26' do
      item = Fabricate(:grocery, exp_date: Date.new(2015,7,26))

      expect(item.show_exp_date).to eq '07/26'
    end
  end
end
