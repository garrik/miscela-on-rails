class AddUniquenessIndexToUsers < ActiveRecord::Migration
  def change
  	add_index :users, :userid, :unique => true
  	add_index :users, :email, :unique => true
  end
end
