class Api::V1::StocksController < ApplicationAPIController
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
end
