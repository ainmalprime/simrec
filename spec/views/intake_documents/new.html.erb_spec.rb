require 'spec_helper'

describe "intake_documents/new" do
  before(:each) do
    assign(:intake_document, stub_model(IntakeDocument,
      :visit_id => 1,
      :image_file_id => 1,
      :description => ""
    ).as_new_record)
  end

  it "renders new intake_document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => intake_documents_path, :method => "post" do
      assert_select "input#intake_document_visit_id", :name => "intake_document[visit_id]"
      assert_select "input#intake_document_image_file_id", :name => "intake_document[image_file_id]"
      assert_select "input#intake_document_description", :name => "intake_document[description]"
    end
  end
end
