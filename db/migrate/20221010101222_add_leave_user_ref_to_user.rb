class AddLeaveUserRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :leave_users,:user, foreing_key: true
  end
end
