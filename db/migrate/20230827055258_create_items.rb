class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string  :name,               null: false, default: ""
      t.text    :explanation,        null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id,      null: false
      t.integer :price,              null: false
      t.integer :user_id,            null: false

      t.timestamps
    end
  end
end
