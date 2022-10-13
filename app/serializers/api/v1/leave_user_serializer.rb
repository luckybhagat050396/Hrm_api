class Api::V1::LeaveUserSerializer < ActiveModel::Serializer
  attributes :id,:start_date,:leave_reason,:leave_type
end
