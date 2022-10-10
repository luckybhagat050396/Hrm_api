class UserMailer < ApplicationMailer
  def send_mail_credential_to_user(user)
    @user = user
    mail(to: @user.email, subject: "Login Credentials")
  end
end
