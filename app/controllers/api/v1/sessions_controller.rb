class Api::V1::SessionsController < ApplicationController
  def create
    user_password = params[:session][:password]
    user_account = params[:session][:account]
    user = user_account.present? && User.find_by(account: user_account)

    if user && (user.valid_password? user_password)
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: {data: user, status: "success"}, status: 200, location: [:api, user]
    else
      render json: {errors: "Invalid email or password"}, status: 422
    end
  end

  def destroy
    user = User.find_by auth_token: params[:id]
    user.generate_authentication_token!
    user.save
    head 204
  end
end
