require "#{Rails.root}/lib/stocks/styvio"

class Stock < ApplicationRecord
  enum status: { inactive: 0, active: 1, archived: 2 }

  validates :ticker, presence: true,
                     uniqueness: true,
                     format: {
                       with: /\A[a-zA-Z]+\Z/
                     }

  before_save :set_ticker_upcase, if: :ticker

  Master::Styvio::DATA_ATTRIBUTES.each do |method|
    define_method method.underscore do
      data[method]
    end
  end

  alias_method :investing_score, :inv_score

  def set_ticker_upcase
    self.ticker = ticker.upcase
  end

  def data_url
    "/api/v1/data/#{ticker}"
  end

  def sentiment_url
    "/api/v1/sentiment/#{ticker}"
  end

  def growth_percent
    calculate_growth(
      all_time_prices.first,
      all_time_prices.last
    )
  end

  def calculate_growth(first_amount, last_amount)
    growth_amount = last_amount - first_amount
    growth_amount / first_amount * 100
  end

  def fetch_data
    self.data = Stocks::Styvio.new.data(ticker)
    self.save
  end

  def fetch_sentiment
    self.sentiment = Stocks::Styvio.new.sentiment(ticker)
    self.save
  end

  def self.fetch_all_data
    Stock.active.each do |stock|
      stock.fetch_data
    end
  end

  def self.fetch_all_sentiment
    Stock.active.each do |stock|
      stock.fetch_sentiment
    end
  end
end
