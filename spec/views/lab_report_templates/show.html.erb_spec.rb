require 'spec_helper'

describe "lab_report_templates/show" do
  before(:each) do
    @lab_report_template = assign(:lab_report_template, stub_model(LabReportTemplate,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
