class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :delivery_address

  with_options presence: true do
    validates :token

  end
  attr_accessor :token
end
