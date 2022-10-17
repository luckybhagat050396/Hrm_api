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
    byebug
    @user = User.find(params[:id])
    render json: {data: Api::V1::UserSerializer.new(@user)}, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      token = jwt_encode(user_id: @user.id)
      render json: {data: Api::V1::UserSerializer.new(@user), token: token}, status: :created
    else 
      render json: {errors: @user.errors.full_messages},
      status: :unprocessable_entity
    end
  end

  def update 
    byebug
    @user= User.find_by(id: params[:id])
    if @user.update(user_params)
      render json: {data: Api::V1::UserSerializer.new(@user)} 
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
    # params.require(:data).permit(attributes: [:name,:username,:email,:password,:role_id,:total_leave,:image])
    params.permit(:id ,:name,:username,:email,:password,:role_id,:total_leave,:picture)
  end

  def set_user
    @user = User.find(params[:id])
  end


end

