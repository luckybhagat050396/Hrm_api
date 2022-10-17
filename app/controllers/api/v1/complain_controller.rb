class Api::V1::ComplainController < Api::V1::AuthenticationController

  def index
    complain = Complain.all
    render json: complain
  end

  def create
    byebug
    complain = @current_user.complains.create(complain_params)
    if complain.present?
      ComplainMailJob.perform_now(complain)
      render json: {data: Api::V1::ComplainSerializer.new(complain)} 
    else 
      render json: {error: complain.errors.full_messages}
    end
  end

  def destroy
    complain = Complain.find_by(id: params[:id])
    if complain.present?
      complain.destroy
      render json: {message: "Complain deleted"}
    else
      render json: {error: complain.errors.full_messages}
    end
  end


  def complain_params
    params.permit(:description,:user_id,:acessory_id)
  end

end
