class Api::V1::SessionsController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token!, only: [:destroy]
  respond_to :json
  
  def create
    user_password = params[:session][:password]
    user_account = params[:session][:account]
    user = user_account.present? && User.find_by(account: user_account)

    if user && (user.valid_password? user_password)
      sign_in user, store: false
      # user.generate_authentication_token!
      user.save
      render json: {data: user, status: "success"}, status: 200, location: [:api, user]
    else
      render json: {status: "error", error: true, errors: "Invalid email or password"}, status: 422
    end
  end

  def destroy
    user = current_user
    user.generate_authentication_token!
    return render json: {status: "success"}, status: 200 if user.save
    return render json: {status: "errors"}
  end
end
