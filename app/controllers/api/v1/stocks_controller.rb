class Api::V1::StocksController < ApplicationAPIController
  before_action :authenticate_user!, only: [ :favorite, :favorites ]

  def index
    stocks = []

    Stock.all.each do |stock|
      stocks << {
        id: stock.id,
        ticker: stock.ticker,
        logo_url: stock.logo_url,
        short_name: stock.short_name
      }
    end

    render json: stocks
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
