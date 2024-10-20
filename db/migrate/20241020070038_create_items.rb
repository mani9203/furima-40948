class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_title,           null: false
      t.references :user,             null: false, foreign_key:true
      t.text :explanation,            null: false
      t.integer :category_id,         null: false
      t.integer :condition_id,        null: false
      t.integer :shipping_fee_id,      null: false
      t.integer :shipping_source_id,   null: false
      t.integer :delivery_day_id,      null:false
      t.integer :sells_price,          null:false
      t.timestamps
    end
  end
end
