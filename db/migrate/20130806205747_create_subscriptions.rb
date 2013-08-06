class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :event
      t.string :userid
      t.string :email
      t.string :name
      t.string :band_name
      t.integer :band_members
      t.string :genre
      t.string :city
      t.string :notes
      t.string :website
      t.string :website2
      t.string :video_link

      t.timestamps
    end
    change_column :subscriptions, :event, :string, :null => false
    change_column :subscriptions, :userid, :string, :null => false
    change_column :subscriptions, :email, :string, :null => false
  end
end
