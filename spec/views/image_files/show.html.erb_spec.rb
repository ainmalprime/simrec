require 'spec_helper'

describe "image_files/show" do
  before(:each) do
    @image_file = assign(:image_file, stub_model(ImageFile,
      :description => "Description",
      :content_type => "Content Type",
      :filename => "Filename",
      :binary_data => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/Content Type/)
    rendered.should match(/Filename/)
    rendered.should match(//)
  end
end
