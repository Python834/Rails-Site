class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.date :published_date
      t.string :author
      t.string :content

      t.timestamps
    end
  end
end
