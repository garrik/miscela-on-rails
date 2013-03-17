class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.string :content
      t.boolean :draft
      t.string :permalink

      t.timestamps
    end
  end
end
