require "administrate/base_dashboard"

class StockDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id:         Field::Number,
    ticker:     Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    ticker
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    ticker
    created_at
    updated_at
  ]

  FORM_ATTRIBUTES = %i[
    ticker
  ]

  COLLECTION_FILTERS = {}.freeze
end
