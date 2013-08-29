class CreateBandMembers < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :band_members, :band_members_number

    create_table :band_members do |t|
      t.integer :subscription_id
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.integer :rank

      t.timestamps
    end
  end
end
