class Address
  include ActiveModel::Model

  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture, :city, :house_number, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\d{10,11}/ }, length: { maximum: 11 }
    
  end

  validates :prefecture, numericality: { other_than: 0, message: 'select' }

  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    DeliveryAddress.create!(purchase_id: purchase.id, postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building: building, phone_number: phone_number)
  end
end
