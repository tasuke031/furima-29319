class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,      null: false, foreign_key: true
      t.string :name,          null: false
      t.text :description,     null: false
      t.integer :price,        null: false
      t.integer :category,     null: false
      t.integer :status,       null: false
      t.integer :delivery_fee, null: false
      t.integer :prefecture,   null: false
      t.integer :delivery_day, null: false
      t.timestamps
    end
  end
end
