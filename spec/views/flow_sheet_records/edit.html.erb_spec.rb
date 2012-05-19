require 'spec_helper'

describe "flow_sheet_records/edit" do
  before(:each) do
    @flow_sheet_record = assign(:flow_sheet_record, stub_model(FlowSheetRecord,
      :visit_id => 1,
      :temp => "MyString",
      :bloodPressure => "MyString",
      :respiratoryRate => "MyString",
      :oxygenSaturation => "MyString",
      :intakePO => "MyString",
      :intakeIV => "MyString",
      :intakeOther => "MyString",
      :intakeOtherDescription => "MyString",
      :outputUrine => "MyString",
      :outputFeces => "MyString",
      :outputBlood => "MyString",
      :outputOther => "MyString",
      :outputOtherDescription => "MyString",
      :retainOnReset => 1
    ))
  end

  it "renders the edit flow_sheet_record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => flow_sheet_records_path(@flow_sheet_record), :method => "post" do
      assert_select "input#flow_sheet_record_visit_id", :name => "flow_sheet_record[visit_id]"
      assert_select "input#flow_sheet_record_temp", :name => "flow_sheet_record[temp]"
      assert_select "input#flow_sheet_record_bloodPressure", :name => "flow_sheet_record[bloodPressure]"
      assert_select "input#flow_sheet_record_respiratoryRate", :name => "flow_sheet_record[respiratoryRate]"
      assert_select "input#flow_sheet_record_oxygenSaturation", :name => "flow_sheet_record[oxygenSaturation]"
      assert_select "input#flow_sheet_record_intakePO", :name => "flow_sheet_record[intakePO]"
      assert_select "input#flow_sheet_record_intakeIV", :name => "flow_sheet_record[intakeIV]"
      assert_select "input#flow_sheet_record_intakeOther", :name => "flow_sheet_record[intakeOther]"
      assert_select "input#flow_sheet_record_intakeOtherDescription", :name => "flow_sheet_record[intakeOtherDescription]"
      assert_select "input#flow_sheet_record_outputUrine", :name => "flow_sheet_record[outputUrine]"
      assert_select "input#flow_sheet_record_outputFeces", :name => "flow_sheet_record[outputFeces]"
      assert_select "input#flow_sheet_record_outputBlood", :name => "flow_sheet_record[outputBlood]"
      assert_select "input#flow_sheet_record_outputOther", :name => "flow_sheet_record[outputOther]"
      assert_select "input#flow_sheet_record_outputOtherDescription", :name => "flow_sheet_record[outputOtherDescription]"
      assert_select "input#flow_sheet_record_retainOnReset", :name => "flow_sheet_record[retainOnReset]"
    end
  end
end
