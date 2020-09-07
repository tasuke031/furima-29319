class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @address = Address.new
  end
  
  def create
    @item = Item.find(params[:item_id])
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

  def purchase_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :house_number, :building, :phone_number
      ).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_params[:token],
      currency:'jpy' )
  end
end
