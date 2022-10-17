class Api::V1::UserSerializer < ActiveModel::Serializer
  
  attributes :id, :name, :email, :user_name, :phone_number, :picture

  
  attribute :picture do |object|
    byebug
    if object.picture.present?
    Rails.application.routes.url_helpers.rails_blob_url(object.picture)
    end
  end
end
  

  