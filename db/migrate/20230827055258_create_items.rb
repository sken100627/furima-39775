class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string  :name,               null: false, default: ""
      t.text    :explanation,        null: false, default: ""
      t.integer :category_id,        null: false, default: ""
      t.integer :condition_id,       null: false, default: ""
      t.integer :shipping_charge_id, null: false, default: ""
      t.integer :prefecture_id,      null: false, default: ""
      t.integer :price,              null: false, default: ""
      t.integer :user_id,            null: false, default: ""

      t.timestamps
    end
  end
end
