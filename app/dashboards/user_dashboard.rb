require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id:                     Field::Number,
    name:                   Field::String,
    email:                  Field::String,
    password:               Field::Password,
    role:                   Field::Select.with_options(
      collection: User.roles.keys
    ),
    encrypted_password:     Field::String,
    reset_password_token:   Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at:    Field::DateTime,
    sign_in_count:          Field::Number,
    current_sign_in_at:     Field::DateTime,
    last_sign_in_at:        Field::DateTime,
    current_sign_in_ip:     Field::String,
    last_sign_in_ip:        Field::String,
    confirmation_token:     Field::String,
    confirmed_at:           Field::DateTime,
    confirmation_sent_at:   Field::DateTime,
    favorites:              Field::HasMany,
    created_at:             Field::DateTime,
    updated_at:             Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    email
    encrypted_password
    favorites
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    email
    role
    favorites
    encrypted_password
    reset_password_token
    reset_password_sent_at
    remember_created_at
    sign_in_count
    current_sign_in_at
    last_sign_in_at
    current_sign_in_ip
    last_sign_in_ip
    confirmation_token
    confirmed_at
    confirmation_sent_at
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    email
    password
    role
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
