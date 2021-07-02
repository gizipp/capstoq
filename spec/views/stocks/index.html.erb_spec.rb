require 'rails_helper'

RSpec.describe "stocks/index", type: :view do
  before(:each) do
    assign(:stocks, [
      Stock.create!(
        ticker: "Ticker",
        status: :active
      ),
      Stock.create!(
        ticker: "Ticker",
        status: :active
      )
    ])
  end

  it "renders a list of stocks" do
    render
    assert_select "tr>td", text: "Ticker".upcase.to_s, count: 2
    assert_select "tr>td", text: :active.to_s, count: 2
  end
end
