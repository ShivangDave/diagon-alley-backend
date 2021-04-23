class Api::V1::AuthController < ApplicationController

  def create
    @user = Api::V1::User.find_by(email: users_params[:email])

    if @user && @user.authenticate(users_params[:password])
      render :json => Api::V1::UserSerializer.new(
        @user,include: [:user_addresses]
      ).serializable_hash, :status => :ok
    else
      render :json => { "error" => "Login failure.." }, :status => :ok
    end
  end

  private
  def users_params
    params.require(:user).permit(:email,:password)
  end

end
