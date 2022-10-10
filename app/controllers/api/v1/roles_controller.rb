class Api::V1::RolesController < ApplicationController

  def index
    @role= Role.all
    render json: @role 
  end

  def create
    @role= Role.new(role_params)
    if @role.save
      render json: @role 
    else
      render json:{error: @role.errors.full_messages}
    end
  end

  def role_params
    params.require(:role).permit(:name)  
  end
end
