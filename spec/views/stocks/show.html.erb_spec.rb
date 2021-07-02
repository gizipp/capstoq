require 'rails_helper'

RSpec.describe "stocks/show", type: :view do
  before(:each) do
    @stock = assign(:stock, Stock.create!(
      ticker: "Ticker",
      status: :active
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ticker/)
    expect(rendered).to match(/2/)
  end
end
