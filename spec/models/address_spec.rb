require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#create' do
    before do
      @address = FactoryBot.build(:address)
    end

    it "token, postal_code, prefecture, city, house_number, phone_numberが正しく入力されていれば登録できること" do
      expect(@address).to be_valid
    end

    it "tokenが空では購入できないこと" do
      @address.token = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Token can't be blank")
    end

    it "postal_codeが空では購入できないこと" do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeが-(ハイフン)を含んでいないと購入できないこと" do
      @address.postal_code = "0000000"
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code is invalid")
    end

    it "prefectureを選択しないと購入できないこと" do
      @address.prefecture = 0
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture select")
    end

    it "cityが空だと購入できないこと" do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが空だと購入できないこと" do
      @address.house_number  = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("House number can't be blank")
    end

    it "phone_numberが空だと購入できないこと" do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end

  end
end
