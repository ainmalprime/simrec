# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recent_activity do
    time_recorded "2012-06-26 17:13:02"
    description "MyString"
    resource "MyString"
    resource_id 1
  end
end
