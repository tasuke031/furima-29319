class PurchasesController < ApplicationController
  def index
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      #amount: purchase_params[:price] 
      card: purchase_params[:token],
      currency:'jpy' 
    )
  end
end
