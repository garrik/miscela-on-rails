class AddFilesToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :song1_file_name, :string
    add_column :subscriptions, :song1_content_type, :string
    add_column :subscriptions, :song1_file_size, :integer
    add_column :subscriptions, :song1_updated_at, :datetime

    add_column :subscriptions, :song2_file_name, :string
    add_column :subscriptions, :song2_content_type, :string
    add_column :subscriptions, :song2_file_size, :integer
    add_column :subscriptions, :song2_updated_at, :datetime

    add_column :subscriptions, :attachment_file_name, :string
    add_column :subscriptions, :attachment_content_type, :string
    add_column :subscriptions, :attachment_file_size, :integer
    add_column :subscriptions, :attachment_updated_at, :datetime
  end
end
