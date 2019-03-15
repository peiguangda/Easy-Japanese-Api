class Api::V1::UsersController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!, only: [:update, :destroy]
  respond_to :json

  def create
    user = User.new user_params
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def show
    respond_with find_user
  end

  def update
    user = current_user
    if user.update user_params
      render json: user, status: 200, location: [:api, user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def destroy
    if current_user.destroy
      render json: {status: "success"}
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit :account, :email, :password, :password_confirmation,
                                 :full_name, :phone_number, :description, :avatar_url, :gender
  end

  def find_user
    User.find params[:id]
  end
end
