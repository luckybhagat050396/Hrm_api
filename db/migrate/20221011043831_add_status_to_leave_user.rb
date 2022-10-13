class AddStatusToLeaveUser < ActiveRecord::Migration[7.0]
  def change
    add_column :leave_users,:status, :integer,default: 0
  end
end
