require 'spec_helper'

describe "lab_and_diagnostic_reports/edit" do
  before(:each) do
    @lab_and_diagnostic_report = assign(:lab_and_diagnostic_report, stub_model(LabAndDiagnosticReport,
      :visit_id => 1,
      :clinician_order_id => 1,
      :image_file_id => 1,
      :release_delay => 1,
      :visible => 1,
      :result_text => "MyText"
    ))
  end

  it "renders the edit lab_and_diagnostic_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lab_and_diagnostic_reports_path(@lab_and_diagnostic_report), :method => "post" do
      assert_select "input#lab_and_diagnostic_report_visit_id", :name => "lab_and_diagnostic_report[visit_id]"
      assert_select "input#lab_and_diagnostic_report_clinician_order_id", :name => "lab_and_diagnostic_report[clinician_order_id]"
      assert_select "input#lab_and_diagnostic_report_image_file_id", :name => "lab_and_diagnostic_report[image_file_id]"
      assert_select "input#lab_and_diagnostic_report_release_delay", :name => "lab_and_diagnostic_report[release_delay]"
      assert_select "input#lab_and_diagnostic_report_visible", :name => "lab_and_diagnostic_report[visible]"
      assert_select "textarea#lab_and_diagnostic_report_result_text", :name => "lab_and_diagnostic_report[result_text]"
    end
  end
end
