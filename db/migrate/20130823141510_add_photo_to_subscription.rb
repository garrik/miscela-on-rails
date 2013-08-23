class AddPhotoToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :photo_file_name, :string
    add_column :subscriptions, :photo_content_type, :string
    add_column :subscriptions, :photo_file_size, :integer
    add_column :subscriptions, :photo_updated_at, :datetime
  end
end
