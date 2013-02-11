class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :author
      t.datetime :createdate
      t.datetime :modifydate
      t.string :title
      t.text :content
      t.boolean :draft
      t.string :permalink

      t.timestamps
    end
  end
  def down
    drop_table :articles
  end
end
