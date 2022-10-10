class LeaveUserMailer < ApplicationMailer
  def user_leave_detail(leave_user)
    byebug
    @user= leave_user
    mail(to: @user.user.email, subject: "Leave Details")
  end
end
