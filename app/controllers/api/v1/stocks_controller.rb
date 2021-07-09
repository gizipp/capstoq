class Api::V1::StocksController < ApplicationAPIController
  before_action :authenticate_user!, only: [ :favorite, :favorites ]

  def index
    render json: Stock.all.select(:id, :ticker)
  end

  def data
    stock = Stock.find_by(ticker: params[:ticker].upcase)
    render json: stock.data
  end

  def sentiment
    stock = Stock.find_by(ticker: params[:ticker].upcase)
    render json: stock.sentiment
  end

  def favorites
    render json: current_user.favorites
  end

  def favorite
    favorite = current_user.favorites
                           .find_or_initialize_by(stock_id: params[:stock_id])


    if favorite.new_record?
      if favorite.save
        render json: favorite, status: :created
      else
        render json: favorite.errors.full_messages, status: :unprocessable_entity
      end
    else
      favorite.destroy
      render json: favorite, status: :no_content
    end
  end
end
