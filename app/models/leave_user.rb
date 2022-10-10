class LeaveUser < ApplicationRecord
  belongs_to :user
  # validates :start_date, uniqueness: true
 

  # before_save :count_total_days_of_leaves

  # def count_total_days_of_leaves
  #   a = @current_user.leave_users.select(:start_date).map(:start_date).last.count
  #   self.total_leave = a
  # end
  after_create do
   LeaveUserMailer.user_leave_detail(self).deliver_now
  end
end
    