class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.float :selling_price
      t.float :cost_of_products
      t.float :weight
      t.string :thumbnail
      t.string :full_image

      t.timestamps
    end
  end
end
