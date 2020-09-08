class PurchasesController < ApplicationController
  before_action :set_params, only: [:index, :create]

  def index
    @address = Address.new
    unless user_signed_in?
      redirect_to user_session_path
    end

    if user_signed_in? && @item.user_id == current_user.id
      redirect_to root_path

    elsif Purchase.find_by(item_id: @item.id)
      redirect_to root_path
    end
  end

  def create
    @address = Address.new(purchase_params)
    if @address.valid?
      pay_item
      @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_params
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :house_number, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy')
  end
end
