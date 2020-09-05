class PurchaseDelivery

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]\z/ }
  end

    validates :prefecture, numericality: { other_than: 0, message: "select" }

    def save
      purchase = Purchase.create(token: token)
      DeliveryDelivery.create(purchase_id: purchase.id, postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building: building, phone_number: phone_number)
    end
end