require 'spec_helper'

describe "lab_report_templates/new" do
  before(:each) do
    assign(:lab_report_template, stub_model(LabReportTemplate,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new lab_report_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lab_report_templates_path, :method => "post" do
      assert_select "input#lab_report_template_name", :name => "lab_report_template[name]"
    end
  end
end
