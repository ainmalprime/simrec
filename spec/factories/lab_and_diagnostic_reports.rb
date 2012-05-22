# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lab_and_diagnostic_report do
    visit_id 1
    clinician_order_id 1
    image_file_id 1
    release_delay 1
    visible 1
    result_text "MyText"
  end
end
