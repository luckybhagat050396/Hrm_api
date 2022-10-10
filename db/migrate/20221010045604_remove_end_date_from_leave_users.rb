class RemoveEndDateFromLeaveUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :leave_users, :end_date, :datetime
  end
end
