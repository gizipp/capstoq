class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
   user: 0,
   admin: 1
  }

  validates_presence_of :name
  validates_length_of   :name,     minimum: 4
  validates_format_of   :email,    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # TODO: Update user specs for password
  # validates_length_of   :password, minimum: 8, on: :create
  # validates_length_of   :password, minimum: 8, on: :update, allow_blank: true
  # validates :password, length: { minimum: 8 }, allow_blank: true
  validates :password, presence: true, length: { minimum: 8 }, on: :create

  has_many :favorites, class_name: 'StockFavorite'

  def access_token
    secret  = Rails.application.credentials.jwt[:secret_key]
    method  = Rails.application.credentials.jwt[:algorithm]
    payload = {
      data: { email: email, name: name },
      iat: Time.now.to_i,
      sub: Rails.application.credentials.jwt[:subject]
    }

    JWT.encode(payload, secret, method)
  end
end
