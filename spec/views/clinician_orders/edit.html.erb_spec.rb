require 'spec_helper'

describe "clinician_orders/edit" do
  before(:each) do
    @clinician_order = assign(:clinician_order, stub_model(ClinicianOrder,
      :visit_id => 1,
      :ordertype => "MyString",
      :ordernote => "MyString",
      :status => "MyString",
      :retainOnReset => 1
    ))
  end

  it "renders the edit clinician_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clinician_orders_path(@clinician_order), :method => "post" do
      assert_select "input#clinician_order_visit_id", :name => "clinician_order[visit_id]"
      assert_select "input#clinician_order_ordertype", :name => "clinician_order[ordertype]"
      assert_select "input#clinician_order_ordernote", :name => "clinician_order[ordernote]"
      assert_select "input#clinician_order_status", :name => "clinician_order[status]"
      assert_select "input#clinician_order_retainOnReset", :name => "clinician_order[retainOnReset]"
    end
  end
end
