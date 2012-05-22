# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image_file do
    description "MyString"
    content_type "MyString"
    filename "MyString"
    binary_data ""
  end
end
