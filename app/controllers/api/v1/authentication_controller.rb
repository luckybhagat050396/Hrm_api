class Api::V1::AuthenticationController < ApplicationController
  before_action :authenticate_request, except: [:login, :approve, :unapprove] 

  private
    def authenticate_request
      header = request.headers["token"]
      header = header.split(" ").last if header
      decoded = jwt_decode(header)
      @current_user = User.find_by(id: decoded[:user_id]) 
      unless @current_user
        return render json: {user: {error: 'Invalid Token'}} 
      end
    end
end
