class ArticleIsDraftByDefault < ActiveRecord::Migration
  def up
    change_column :articles, :draft, :boolean, :default => true
  end

  def down
    change_column :articles, :draft, :boolean, :default => nil
  end
end
