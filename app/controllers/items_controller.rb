class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @purchases = Purchase.all
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
    @purchase = Purchase.find_by(item_id: @item.id)
  end

  def edit
    if @item.user_id != current_user.id
      redirect_to item_path
    elsif
      @purchase = Purchase.find_by(item_id: @item.id)
      @item.id == @purchase.item_id
      redirect_to item_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category,
      :status, :delivery_fee, :prefecture, :delivery_day, :buyed, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
