class Acessory < ApplicationRecord
	belongs_to :user
	has_many :complain
	belongs_to :admin_user
end
