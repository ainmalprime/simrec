require 'spec_helper'

describe "flow_sheet_records/index" do
  before(:each) do
    assign(:flow_sheet_records, [
      stub_model(FlowSheetRecord,
        :visit_id => 1,
        :temp => "Temp",
        :bloodPressure => "Blood Pressure",
        :respiratoryRate => "Respiratory Rate",
        :oxygenSaturation => "Oxygen Saturation",
        :intakePO => "Intake Po",
        :intakeIV => "Intake Iv",
        :intakeOther => "Intake Other",
        :intakeOtherDescription => "Intake Other Description",
        :outputUrine => "Output Urine",
        :outputFeces => "Output Feces",
        :outputBlood => "Output Blood",
        :outputOther => "Output Other",
        :outputOtherDescription => "Output Other Description",
        :retainOnReset => 2
      ),
      stub_model(FlowSheetRecord,
        :visit_id => 1,
        :temp => "Temp",
        :bloodPressure => "Blood Pressure",
        :respiratoryRate => "Respiratory Rate",
        :oxygenSaturation => "Oxygen Saturation",
        :intakePO => "Intake Po",
        :intakeIV => "Intake Iv",
        :intakeOther => "Intake Other",
        :intakeOtherDescription => "Intake Other Description",
        :outputUrine => "Output Urine",
        :outputFeces => "Output Feces",
        :outputBlood => "Output Blood",
        :outputOther => "Output Other",
        :outputOtherDescription => "Output Other Description",
        :retainOnReset => 2
      )
    ])
  end

  it "renders a list of flow_sheet_records" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Temp".to_s, :count => 2
    assert_select "tr>td", :text => "Blood Pressure".to_s, :count => 2
    assert_select "tr>td", :text => "Respiratory Rate".to_s, :count => 2
    assert_select "tr>td", :text => "Oxygen Saturation".to_s, :count => 2
    assert_select "tr>td", :text => "Intake Po".to_s, :count => 2
    assert_select "tr>td", :text => "Intake Iv".to_s, :count => 2
    assert_select "tr>td", :text => "Intake Other".to_s, :count => 2
    assert_select "tr>td", :text => "Intake Other Description".to_s, :count => 2
    assert_select "tr>td", :text => "Output Urine".to_s, :count => 2
    assert_select "tr>td", :text => "Output Feces".to_s, :count => 2
    assert_select "tr>td", :text => "Output Blood".to_s, :count => 2
    assert_select "tr>td", :text => "Output Other".to_s, :count => 2
    assert_select "tr>td", :text => "Output Other Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
