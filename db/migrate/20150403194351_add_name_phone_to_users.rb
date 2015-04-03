class AddNamePhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :phone, :string
  end
end
