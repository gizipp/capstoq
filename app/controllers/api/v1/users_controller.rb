class Api::V1::UsersController < ApplicationAPIController
  before_action :authenticate_user!, only: :update

  def signup
    user = User.create(permitted_params)
    if user.errors.blank?
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def signin
    user = User.find_by(email: permitted_params[:email])
    if user.present? && user.valid_password?(permitted_params[:password])
      render json: { jwt: user.access_token }
    else
      render json: user.errors.full_messages
    end
  end

  def update
    current_user.assign_attributes(permitted_params)

    if current_user.save
      render json: current_user
    else
      render json: { data: {
        message: 'User attribute not updated',
        params: permitted_params
      }, error: 'Update not sucess'}, status: :bad_request
    end
  end


  private

  def permitted_params
    params.permit(:email, :name, :password)
  end
end
