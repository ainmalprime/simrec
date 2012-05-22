require 'spec_helper'

describe "lab_and_diagnostic_reports/index" do
  before(:each) do
    assign(:lab_and_diagnostic_reports, [
      stub_model(LabAndDiagnosticReport,
        :visit_id => 1,
        :clinician_order_id => 2,
        :image_file_id => 3,
        :release_delay => 4,
        :visible => 5,
        :result_text => "MyText"
      ),
      stub_model(LabAndDiagnosticReport,
        :visit_id => 1,
        :clinician_order_id => 2,
        :image_file_id => 3,
        :release_delay => 4,
        :visible => 5,
        :result_text => "MyText"
      )
    ])
  end

  it "renders a list of lab_and_diagnostic_reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
