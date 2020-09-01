class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "nicknameを入力して下さい" }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i  }
    #passwordは半角英数混合 /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください" }
    validates :family_reading, format: { with: /\A[ァ-ン]/, message: "全角で入力してください" }
    validates :first_reading, format: { with: /\A[ァ-ン]/, message: "全角で入力してください" }
    
    validates :birthday
  end         
end
