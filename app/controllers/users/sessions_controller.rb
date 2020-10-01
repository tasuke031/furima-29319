class Users::SessionsController < Devise::SessionsController
  def customer_guest
    user1 = User.guest
    sign_in user1
    redirect_to root_path, notice: "テストユーザー(購入者)としてログインしました"
  end

  def new_guest
    user2 = User.new_guest
    sign_in user2
    redirect_to root_path, notice: "テストユーザー(出品者)としてログインしました"
  end
end