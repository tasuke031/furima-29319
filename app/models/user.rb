class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname, format: { with: /\A[a-zA-Zぁ-んァ-ン一-龥]/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_reading, format: { with: /\A[ァ-ン]/ }
    validates :first_reading, format: { with: /\A[ァ-ン]/ }
    validates :birthday
  end
end
