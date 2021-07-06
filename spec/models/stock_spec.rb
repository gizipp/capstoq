describe Stock, type: :model do
  describe 'validations' do
    context '.ticker' do
      it { should validate_presence_of(:ticker) }
      it { should validate_uniqueness_of(:ticker) }
      it { should allow_value("GOOGL").for(:ticker) }
      it { should_not allow_value("GOO  GL").for(:ticker) }
      it { should_not allow_value("GOO@GL").for(:ticker) }
    end

    it { should define_enum_for(:status).with_values([:inactive, :active, :archived]) }
  end

  describe '.ticker' do
    it 'set value uppercase letter' do
      ticker_with_downcase_letter = 'GooGL'
      stock = Stock.new(ticker: 'GooGL')
      stock.save!

      expect(stock.ticker).to eq(ticker_with_downcase_letter.upcase)
    end
  end
end
