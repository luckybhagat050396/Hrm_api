class ComplainMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    byebug
    user_complain = Complain.last
    ComplainMailer.user_complain_details(user_complain).deliver_later
  end

end
