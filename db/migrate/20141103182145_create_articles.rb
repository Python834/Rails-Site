class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.date :published_date
      t.boolean :published
      t.text :content
      t.string :thumbnail

      t.timestamps
    end
  end
end
