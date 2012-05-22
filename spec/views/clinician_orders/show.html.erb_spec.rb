require 'spec_helper'

describe "clinician_orders/show" do
  before(:each) do
    @clinician_order = assign(:clinician_order, stub_model(ClinicianOrder,
      :visit_id => 1,
      :ordertype => "Ordertype",
      :ordernote => "Ordernote",
      :status => "Status",
      :retainOnReset => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Ordertype/)
    rendered.should match(/Ordernote/)
    rendered.should match(/Status/)
    rendered.should match(/2/)
  end
end
