require 'spec_helper'

describe "lab_report_templates/edit" do
  before(:each) do
    @lab_report_template = assign(:lab_report_template, stub_model(LabReportTemplate,
      :name => "MyString"
    ))
  end

  it "renders the edit lab_report_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lab_report_templates_path(@lab_report_template), :method => "post" do
      assert_select "input#lab_report_template_name", :name => "lab_report_template[name]"
    end
  end
end
