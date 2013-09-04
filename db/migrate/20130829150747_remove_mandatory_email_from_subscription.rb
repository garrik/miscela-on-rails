class RemoveMandatoryEmailFromSubscription < ActiveRecord::Migration
  def up
    change_column :subscriptions, :email, :string, :null => true
  end

  def down
    change_column :subscriptions, :email, :string, :null => false
  end
end
