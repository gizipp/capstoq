class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def access_token
    secret = Rails.application.credentials.jwt[:secret_key]
    method = Rails.application.credentials.jwt[:algorithm]
    payload = {
      data: { email: email, name: name },
      iat: Time.now.to_i,
      sub: Rails.application.credentials.jwt[:subject]
    }

    JWT.encode(payload, secret, method)
  end
end
