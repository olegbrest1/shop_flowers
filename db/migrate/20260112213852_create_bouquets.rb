class CreateBouquets < ActiveRecord::Migration[8.1]
 def change
    create_table :bouquets do |t|
      t.string  :name, null: false          # название
      t.decimal :price, precision: 10, scale: 2, null: false # цена
      t.text    :description                # описание
      t.boolean :available, default: true   # наличие

      t.timestamps
    end
  end
end