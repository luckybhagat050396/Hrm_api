class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :leave_users
  has_many :mentors, class_name: "User",foreign_key: "manager_id"
  belongs_to :manager, class_name: "User", optional: true
  before_validation do
  	self.password = "Task@123"
  	self.password_confirmation = self.password
  end

  after_create do
  	UserMailer.send_mail_credential_to_user(self).deliver_now
  end
end
