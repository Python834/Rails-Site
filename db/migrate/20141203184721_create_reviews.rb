class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.string :opinion
      t.integer :rating
      t.string :thumbnail
      t.belongs_to :blog, index: true

      t.timestamps
    end
  end
end
