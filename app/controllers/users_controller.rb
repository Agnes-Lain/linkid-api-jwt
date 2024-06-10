class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :destroy, :update]

  # Get /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # Get /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  # PUT /users/
  def update
    # binding.pry
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  # delete /users/
  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    # @user = User.find(params[:id])
    @user = @current_user
  end
end
