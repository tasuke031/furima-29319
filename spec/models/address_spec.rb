require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#create' do
    before do
      @address = FactoryBot.build(:address)
      @token = 
    end

    it "card(number, cvc, exp_month, exp_year), postal_code, prefecture, city, house_number, phone_numberが正しく入力されていれば登録できること" do
      expect(@address).to be_valid
    end
end
