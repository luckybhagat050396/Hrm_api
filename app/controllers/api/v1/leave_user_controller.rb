class Api::V1::LeaveUserController < Api::V1::AuthenticationController

  def index
    leave= LeaveUser.all 
    render json: leave
  end

  def create
    leave = @current_user.leave_users.create(leave_params)
    if leave.present?
      sig  = leave.start_date.size
      leave.user.update(total_leave: leave.user.total_leave - sig)
      render json: {data: Api::V1::LeaveUserSerializer.new(leave)}
    else 
      render json: {error: leave.errors.full_messages}
    end
  end

  def leave_params
    params.permit(:leave_reason,:leave_type,:user_id,start_date:[])
  end

end
    