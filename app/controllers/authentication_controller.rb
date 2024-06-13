class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]

  # Post /auth/login
  def login
    @user = User.find_by_email(params[:user][:email])
    # binding.pry
    if @user&.authenticate(params[:user][:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end
end
