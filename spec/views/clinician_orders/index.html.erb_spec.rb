require 'spec_helper'

describe "clinician_orders/index" do
  before(:each) do
    assign(:clinician_orders, [
      stub_model(ClinicianOrder,
        :visit_id => 1,
        :ordertype => "Ordertype",
        :ordernote => "Ordernote",
        :status => "Status",
        :retainOnReset => 2
      ),
      stub_model(ClinicianOrder,
        :visit_id => 1,
        :ordertype => "Ordertype",
        :ordernote => "Ordernote",
        :status => "Status",
        :retainOnReset => 2
      )
    ])
  end

  it "renders a list of clinician_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Ordertype".to_s, :count => 2
    assert_select "tr>td", :text => "Ordernote".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
