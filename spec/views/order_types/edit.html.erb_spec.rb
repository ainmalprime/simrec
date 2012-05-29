require 'spec_helper'

describe "order_types/edit" do
  before(:each) do
    @order_type = assign(:order_type, stub_model(OrderType,
      :description => "MyString"
    ))
  end

  it "renders the edit order_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => order_types_path(@order_type), :method => "post" do
      assert_select "input#order_type_description", :name => "order_type[description]"
    end
  end
end
