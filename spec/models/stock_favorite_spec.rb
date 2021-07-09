require 'rails_helper'

describe StockFavorite, type: :model do
  let!(:user)  { create(:user) }
  let!(:stock) { create(:stock) }

  subject { create(:stock_favorite, user: user, stock: stock ) }

  describe 'associations' do
    it { should belong_to(:stock) }
    it { should belong_to(:user) }
  end

  describe 'indexes' do
    it { should have_db_index(:user_id) }
    it { should have_db_index([:stock_id, :user_id]) }
  end

  describe 'validations' do
    it { should validate_presence_of(:stock_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_uniqueness_of(:stock_id).scoped_to(:user_id) }
  end
end
