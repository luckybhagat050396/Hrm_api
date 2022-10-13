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

  def approve
    byebug
    leave = LeaveUser.find_by(id: params[:id])
    if leave.present?
      leave.update(status: "approved")
      render json: {message: "Thanks for your response."}
    else 
      render json: {error: "something wrong"}
    end  
  end

  def unapprove
    leave = LeaveUser.find_by(id: params[:id])
    if leave.present?
      leave.update(status: "unapproved")
      render json: {message: "Thanks for your response."} 
    else 
      render json: {error: leave.errors.full_messages}
    end
  end

  def destroy
    leave = LeaveUser.find_by(id: params[:id])
    if leave.present?
      leave.destroy
      render json: {message:"Leave canceled"}
    else
      render json: {error: leave.errors.full_messages}
    end
  end

  private
  def leave_params
    params.permit(:leave_reason,:status,:leave_type,:user_id,start_date:[])
  end
end
    