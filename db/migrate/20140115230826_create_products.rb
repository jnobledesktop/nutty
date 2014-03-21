class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :sku
      t.text :description
      t.text :specs
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
