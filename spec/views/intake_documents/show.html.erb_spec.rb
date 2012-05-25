require 'spec_helper'

describe "intake_documents/show" do
  before(:each) do
    @intake_document = assign(:intake_document, stub_model(IntakeDocument,
      :visit_id => 1,
      :image_file_id => 2,
      :description => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(//)
  end
end
