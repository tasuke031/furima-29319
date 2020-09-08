class AddNamesToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :item_price, :integer
  end
end
