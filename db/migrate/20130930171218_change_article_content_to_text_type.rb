class ChangeArticleContentToTextType < ActiveRecord::Migration
  def up
  	change_column :articles, :content, :text, limit: nil
  end

  def down
  	change_column :articles, :content, :string
  end
end
