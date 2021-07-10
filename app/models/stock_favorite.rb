class StockFavorite < ApplicationRecord
  belongs_to :stock
  belongs_to :user

  validates_presence_of :stock_id, :user_id
  validates_uniqueness_of :stock_id, scope: :user_id

  def ticker
    stock.ticker
  end
end
