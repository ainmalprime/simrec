require 'spec_helper'

describe "lab_and_diagnostic_reports/show" do
  before(:each) do
    @lab_and_diagnostic_report = assign(:lab_and_diagnostic_report, stub_model(LabAndDiagnosticReport,
      :visit_id => 1,
      :clinician_order_id => 2,
      :image_file_id => 3,
      :release_delay => 4,
      :visible => 5,
      :result_text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/MyText/)
  end
end
