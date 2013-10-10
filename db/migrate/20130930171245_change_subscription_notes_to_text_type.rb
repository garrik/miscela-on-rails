class ChangeSubscriptionNotesToTextType < ActiveRecord::Migration
  def up
  	change_column :subscriptions, :notes, :text, limit: nil
  end

  def down
  	change_column :subscriptions, :notes, :string
  end
end
