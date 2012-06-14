require 'spec_helper'

describe "site_configurations/index" do
  before(:each) do
    assign(:site_configurations, [
      stub_model(SiteConfiguration,
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
      ),
      stub_model(SiteConfiguration,
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
      )
    ])
  end

  it "renders a list of site_configurations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Logo Text".to_s, :count => 2
    assert_select "tr>td", :text => "Logo Text Color".to_s, :count => 2
    assert_select "tr>td", :text => "Top Bar Gradient Start Color".to_s, :count => 2
    assert_select "tr>td", :text => "Top Bar Gradient End Color".to_s, :count => 2
    assert_select "tr>td", :text => "Secondary Bar Gradient Start Color".to_s, :count => 2
    assert_select "tr>td", :text => "Secondary Bar Gradient End Color".to_s, :count => 2
    assert_select "tr>td", :text => "Page Background Color".to_s, :count => 2
    assert_select "tr>td", :text => "Secondary Header Text Color".to_s, :count => 2
    assert_select "tr>td", :text => "Page Background Color".to_s, :count => 2
    assert_select "tr>td", :text => "Patient Info Box Background Color".to_s, :count => 2
  end
end
