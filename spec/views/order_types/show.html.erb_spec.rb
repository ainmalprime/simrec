require 'spec_helper'

describe "order_types/show" do
  before(:each) do
    @order_type = assign(:order_type, stub_model(OrderType,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
