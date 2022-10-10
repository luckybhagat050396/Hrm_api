class RemoveUserIdRefFromLeaveUser < ActiveRecord::Migration[7.0]
  def change
    remove_reference :leave_users, :user, foreing_key: true
  end
end
