class Api::V1::UsersController < Api::V1::AuthenticationController
  skip_before_action :verify_authenticity_token, only:[:login]
  before_action :set_user, only: [:show, :destroy]

  def login
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: {token: token, user: @user}, status: :ok
    else
      render json:{error: 'unauthorized' }, status: :unauthorized
    end
  end

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      token = jwt_encode(user_id: @user.id)
      render json: {data: UserSerializer.new(@user), token: token}, status: :created
    else 
      render json: {errors: @user.errors.full_messages},
      status: :unprocessable_entity
    end
  end

  def update 
    @user= User.find_by(id: params[:id])
    if @user.update(user_params)
      render json: @user 
    else
      render json: {errors: @user.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def destroy
    @user= User.find_by(id: params[:id])
    if @user.present?
      @user.destroy
      render json: {message: "user destroyed"}
    else 
      render json: {errors: @user.errors.full_messages}
    end
  end

  private
  def user_params
    params.require(:data).permit(attributes: [:name,:username,:email,:password,:role_id,:total_leave])
  end

  def set_user
    @user = User.find(params[:id])
  end


end

