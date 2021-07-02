require 'rails_helper'

RSpec.describe "stocks/new", type: :view do
  before(:each) do
    assign(:stock, Stock.new(
      ticker: "MyString",
      status: 1
    ))
  end

  it "renders new stock form" do
    render

    assert_select "form[action=?][method=?]", stocks_path, "post" do

      assert_select "input[name=?]", "stock[ticker]"

      assert_select "select[name=?]", "stock[status]"
    end
  end
end
