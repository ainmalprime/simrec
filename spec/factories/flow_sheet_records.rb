# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :flow_sheet_record do
    visit_id 1
    recordingTime "2012-05-19"
    temp "MyString"
    bloodPressure "MyString"
    respiratoryRate "MyString"
    oxygenSaturation "MyString"
    intakePO "MyString"
    intakeIV "MyString"
    intakeOther "MyString"
    intakeOtherDescription "MyString"
    outputUrine "MyString"
    outputFeces "MyString"
    outputBlood "MyString"
    outputOther "MyString"
    outputOtherDescription "MyString"
    retainOnReset 1
  end
end
