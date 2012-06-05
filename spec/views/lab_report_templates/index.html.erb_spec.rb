require 'spec_helper'

describe "lab_report_templates/index" do
  before(:each) do
    assign(:lab_report_templates, [
      stub_model(LabReportTemplate,
        :name => "Name"
      ),
      stub_model(LabReportTemplate,
        :name => "Name"
      )
    ])
  end

  it "renders a list of lab_report_templates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
