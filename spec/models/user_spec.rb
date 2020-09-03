require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname, email, password, password_confirmation, family_name, first_name, family_reading, first_reading, birthdayが正しく入力されていれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank", "Nickname is invalid")
    end

    it "emailが空では登録できない" do
      @user.email = nil      
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが重複すると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが@を含まないと登録できない" do
      @user.email = "usermail"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下では登録できない" do
      @user.password = "12345"
      @user.password_confirmation ="12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it "passwordが英数混合でないと登録できない" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが存在してもpassword_confimationが空では登録できないこと" do
      @user.password = "a12345"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "family_nameが空では登録できない" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it "family_readingが空では登録できない" do
      @user.family_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family reading can't be blank", "Family reading is invalid")
    end

    it "family_readingが全角カナでないと登録できない" do
      @user.family_reading = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family reading is invalid")
    end

    it "first_readingが空では登録できない" do
      @user.first_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First reading can't be blank", "First reading is invalid")
    end

    it "first_readingが全角カナ出ないと登録できない" do
      @user.first_reading = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First reading is invalid")
    end

    it "birthdayが空では登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end