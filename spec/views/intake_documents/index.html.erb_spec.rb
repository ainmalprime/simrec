require 'spec_helper'

describe "intake_documents/index" do
  before(:each) do
    assign(:intake_documents, [
      stub_model(IntakeDocument,
        :visit_id => 1,
        :image_file_id => 2,
        :description => ""
      ),
      stub_model(IntakeDocument,
        :visit_id => 1,
        :image_file_id => 2,
        :description => ""
      )
    ])
  end

  it "renders a list of intake_documents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
