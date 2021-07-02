class Stock < ApplicationRecord
  enum status: { inactive: 0, active: 1, archived: 2 }

  before_save :set_ticker_uppercase

  validates :ticker, presence: true,
                     uniqueness: true,
                     format: {
                       with: /\A[a-zA-Z]+\Z/
                     }

  def set_ticker_uppercase
    self.ticker = ticker.upcase
  end
end
