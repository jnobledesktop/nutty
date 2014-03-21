class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :customer, index: true

      t.timestamps
    end
  end
end
