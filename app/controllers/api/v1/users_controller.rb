class Api::V1::UsersController < ApplicationAPIController
  def signup
    user = User.create(permitted_params)
    if user.errors.blank?
      render json: user, root: 'data'
    else
      render json: user.errors.full_messages
    end
  end

  def signin
    user = User.find_by(email: permitted_params[:email])
    if user.present? && user.valid_password?(permitted_params[:password])
      render json: user, root: 'data'
    else
      render json: user.errors.full_messages
    end
  end

  private

  def permitted_params
    params.permit(:email, :name, :password)
  end
end
