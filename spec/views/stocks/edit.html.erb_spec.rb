require 'rails_helper'

RSpec.describe "stocks/edit", type: :view do
  before(:each) do
    @stock = assign(:stock, Stock.create!(
      ticker: "MyString",
      status: :active
    ))
  end

  it "renders the edit stock form" do
    render

    assert_select "form[action=?][method=?]", stock_path(@stock), "post" do

      assert_select "input[name=?]", "stock[ticker]"

      assert_select "select[name=?]", "stock[status]"
    end
  end
end
