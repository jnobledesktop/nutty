class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, index: true
      t.references :customer, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
