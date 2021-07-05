class FetchStocksWorker
  include Sidekiq::Worker

  def perform(*args)
    Stock.fetch_all_data
    Stock.fetch_all_sentiment
  end
end
