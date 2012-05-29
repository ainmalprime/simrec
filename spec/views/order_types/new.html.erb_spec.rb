require 'spec_helper'

describe "order_types/new" do
  before(:each) do
    assign(:order_type, stub_model(OrderType,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new order_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => order_types_path, :method => "post" do
      assert_select "input#order_type_description", :name => "order_type[description]"
    end
  end
end
