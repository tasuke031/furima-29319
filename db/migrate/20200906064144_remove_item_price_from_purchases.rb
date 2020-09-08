class RemoveItemPriceFromPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :item_price, :integer
  end
end
