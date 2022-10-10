class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :user_name, :phone_number
  
end
