require "administrate/base_dashboard"

class StockFavoriteDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id:         Field::Number,
    user:       Field::BelongsTo,
    stock:      Field::BelongsTo,
    ticker:     Field::String,
    created_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    ticker
    created_at
  ]
end
