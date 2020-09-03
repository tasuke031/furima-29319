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

  end
end
