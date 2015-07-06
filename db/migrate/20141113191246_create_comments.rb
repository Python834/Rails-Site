class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :opinion
      t.integer :rating
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
