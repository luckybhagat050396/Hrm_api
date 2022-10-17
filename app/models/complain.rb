class Complain < ApplicationRecord
    belongs_to :acessory
    belongs_to :user, touch: true

  after_create do 
    ComplainMailer.user_complain_details(self).deliver_now
  end

  after_destroy do 
    ComplainMailer.user_destroy_mail(self).deliver_now
  end

end
    