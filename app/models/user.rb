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

  def self.guest
    find_or_create_by(email: 'guest1@example.com')do |user|
      user.nickname = "taro"
      user.password = SecureRandom.urlsafe_base64
      user.family_name = "山田"
      user.first_name = "太郎"
      user.family_reading = "ヤマダ"
      user.first_reading = "タロウ"
      user.birthday = "2000-01-01"
    end
  end

  def self.new_guest
    find_or_create_by(email: 'guest2@example.com')do |user|
      user.nickname = "jiro"
      user.password = SecureRandom.urlsafe_base64
      user.family_name = "佐藤"
      user.first_name = "二郎"
      user.family_reading = "サトウ"
      user.first_reading = "ジロウ"
      user.birthday = "2000-01-01"
    end
  end
  
end
