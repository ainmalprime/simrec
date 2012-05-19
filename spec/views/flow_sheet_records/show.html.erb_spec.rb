require 'spec_helper'

describe "flow_sheet_records/show" do
  before(:each) do
    @flow_sheet_record = assign(:flow_sheet_record, stub_model(FlowSheetRecord,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Temp/)
    rendered.should match(/Blood Pressure/)
    rendered.should match(/Respiratory Rate/)
    rendered.should match(/Oxygen Saturation/)
    rendered.should match(/Intake Po/)
    rendered.should match(/Intake Iv/)
    rendered.should match(/Intake Other/)
    rendered.should match(/Intake Other Description/)
    rendered.should match(/Output Urine/)
    rendered.should match(/Output Feces/)
    rendered.should match(/Output Blood/)
    rendered.should match(/Output Other/)
    rendered.should match(/Output Other Description/)
    rendered.should match(/2/)
  end
end
