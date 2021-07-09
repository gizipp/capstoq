describe User, type: :model do
  describe 'associations' do
    it { should have_many(:favorites).class_name("StockFavorite") }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value("email@gmail.com").for(:email) }
    it { should_not allow_value("email with spce").for(:email) }
    it { should_not allow_value("this@email").for(:email) }
    it { should define_enum_for(:role).with_values([:user, :admin]) }
  end
end
