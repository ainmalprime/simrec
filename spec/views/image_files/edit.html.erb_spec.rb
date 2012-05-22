require 'spec_helper'

describe "image_files/edit" do
  before(:each) do
    @image_file = assign(:image_file, stub_model(ImageFile,
      :description => "MyString",
      :content_type => "MyString",
      :filename => "MyString",
      :binary_data => ""
    ))
  end

  it "renders the edit image_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => image_files_path(@image_file), :method => "post" do
      assert_select "input#image_file_description", :name => "image_file[description]"
      assert_select "input#image_file_content_type", :name => "image_file[content_type]"
      assert_select "input#image_file_filename", :name => "image_file[filename]"
      assert_select "input#image_file_binary_data", :name => "image_file[binary_data]"
    end
  end
end
