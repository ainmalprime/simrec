# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :action_log_entry do
    description "MyString"
    content "MyText"
    sim_session "MyText"
  end
end
