# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clinician_order do
    visit_id 1
    ordertype "MyString"
    ordernote "MyString"
    timerecorded "2012-05-22 09:00:47"
    status "MyString"
    timeprocessed "2012-05-22 09:00:47"
    retainOnReset 1
  end
end
