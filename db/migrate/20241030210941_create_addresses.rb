class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,        null: false
      t.float      :shipping_source_id,        null: false
      t.string     :municipality,        null: false
      t.string     :block_number,        null: false
      t.string     :building_name       
      t.string     :telephone_number,        null: false
      t.references :sell,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
