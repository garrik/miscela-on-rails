class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :userid
      t.string :password_digest

      t.timestamps
    end
  end
end
