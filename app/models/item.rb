class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, format: { with: /\A\d/, message: 'half-width number'}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'out of setting range' }
    validates :category, numericality: { other_than: 0, messege: 'select' }
    validates :status, numericality: { other_than: 0, messege: 'select' }
    validates :delivery_fee, numericality: { other_than: 0, messege: 'select' }
    validates :delivery_day, numericality: { other_than: 0, messege: 'select' }
    validates :prefecture, numericality: { other_than: 0, messege: 'select' }
  end
end
