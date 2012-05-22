require 'spec_helper'

describe "image_files/index" do
  before(:each) do
    assign(:image_files, [
      stub_model(ImageFile,
        :description => "Description",
        :content_type => "Content Type",
        :filename => "Filename",
        :binary_data => ""
      ),
      stub_model(ImageFile,
        :description => "Description",
        :content_type => "Content Type",
        :filename => "Filename",
        :binary_data => ""
      )
    ])
  end

  it "renders a list of image_files" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Content Type".to_s, :count => 2
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
