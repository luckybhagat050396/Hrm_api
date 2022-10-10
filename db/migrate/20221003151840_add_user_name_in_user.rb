class AddUserNameInUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role
    add_column :users, :name, :string
    add_column :users, :user_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :total_leave, :integer

  end
end
