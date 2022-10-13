class LeaveUserMailer < ApplicationMailer
  def user_leave_detail(leave_user)
    @leave_user = leave_user
    mail(to: @leave_user.user.manager.email, subject: "Leave Details")
  end

  def user_leave_approve(leave_user)
    @approve = leave_user
    mail(to: @approve.user.email, subject: "Leave Status")
  end

  def user_leave_unapprove(leave_user)
    @unapprove = leave_user
    mail(to: @unapprove.user.email, subject: "Leave Status")
  end
end
