class ComplainMailer < ApplicationMailer
  def user_complain_details(user_complain)
    @complain = user_complain
    mail(to: @complain.acessory.admin_user.email, subject: "Regarding Accessory complain")
  end

  def user_destroy_mail(user_destroy)
    @destroy = user_destroy
    mail(to: @destroy.user.email, subject: "Regarding complain cancellation")
  end
end
