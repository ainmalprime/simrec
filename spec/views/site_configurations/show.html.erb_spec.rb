require 'spec_helper'

describe "site_configurations/show" do
  before(:each) do
    @site_configuration = assign(:site_configuration, stub_model(SiteConfiguration,
      :location_name => "Location Name",
      :image_file_id => 1,
      :logo_text => "Logo Text",
      :logo_text_color => "Logo Text Color",
      :top_bar_gradient_start_color => "Top Bar Gradient Start Color",
      :top_bar_gradient_end_color => "Top Bar Gradient End Color",
      :secondary_bar_gradient_start_color => "Secondary Bar Gradient Start Color",
      :secondary_bar_gradient_end_color => "Secondary Bar Gradient End Color",
      :page_background_color => "Page Background Color",
      :secondary_header_text_color => "Secondary Header Text Color",
      :page_background_color => "Page Background Color",
      :patient_info_box_background_color => "Patient Info Box Background Color"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location Name/)
    rendered.should match(/1/)
    rendered.should match(/Logo Text/)
    rendered.should match(/Logo Text Color/)
    rendered.should match(/Top Bar Gradient Start Color/)
    rendered.should match(/Top Bar Gradient End Color/)
    rendered.should match(/Secondary Bar Gradient Start Color/)
    rendered.should match(/Secondary Bar Gradient End Color/)
    rendered.should match(/Page Background Color/)
    rendered.should match(/Secondary Header Text Color/)
    rendered.should match(/Page Background Color/)
    rendered.should match(/Patient Info Box Background Color/)
  end
end
