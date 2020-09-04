class ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category,
      :status, :delivery_fee, :prefecture, :delivery_day, :buyed).merge(user_id: current_user.id)
  end
end
