# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :intake_document do
    visit_id 1
    image_file_id 1
    description ""
    timerecorded "2012-05-24 17:21:33"
  end
end
