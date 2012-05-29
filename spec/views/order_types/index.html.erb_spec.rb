require 'spec_helper'

describe "order_types/index" do
  before(:each) do
    assign(:order_types, [
      stub_model(OrderType,
        :description => "Description"
      ),
      stub_model(OrderType,
        :description => "Description"
      )
    ])
  end

  it "renders a list of order_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
