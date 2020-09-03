require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image =fixture_file_upload('app/assets/images/camera.png')
    end

    it "name,image,price,description,category,status,delivery_fee,prefecture,delivery_dayが正しく入力されていれば出品できること" do
      expect(@item).to be_valid
    end

    it "imageが空だと出品できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空だと出品できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "descriptionが空だと出品できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "categoryが空だと出品できないこと" do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "statusが空では出品できないこと" do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
    end

    it "delivery_feeが空では出品できないこと" do
      @item.delivery_fee = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
    end

    it "prefectureが空では出品できないこと" do
      @item.prefecture = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it "delivery_dayが空では出品できないこと" do
      @item.delivery_day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
    end

    it "priceが空では出品できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが¥300以上でないと出品できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price out of setting range")
    end

    it "priceが¥9,999,999以下でないと出品できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price out of setting range")
    end

    it "priceが半角数字でないと出品できないこと" do
      @item.price = @item.name
      @item.valid?
      expect(@item.errors.full_messages).to include("Price out of setting range")
    end

  end
end
