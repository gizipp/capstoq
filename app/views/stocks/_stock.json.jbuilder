json.extract!(stock,
  :id, :ticker, :short_name, :logo_url, :trade_score, :investing_score,
  :status, :created_at, :updated_at
)
json.url stock_url(stock, format: :json)
