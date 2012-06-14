require 'spec_helper'

describe "site_configurations/edit" do
  before(:each) do
    @site_configuration = assign(:site_configuration, stub_model(SiteConfiguration,
      :location_name => "MyString",
      :image_file_id => 1,
      :logo_text => "MyString",
      :logo_text_color => "MyString",
      :top_bar_gradient_start_color => "MyString",
      :top_bar_gradient_end_color => "MyString",
      :secondary_bar_gradient_start_color => "MyString",
      :secondary_bar_gradient_end_color => "MyString",
      :page_background_color => "MyString",
      :secondary_header_text_color => "MyString",
      :page_background_color => "MyString",
      :patient_info_box_background_color => "MyString"
    ))
  end

  it "renders the edit site_configuration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => site_configurations_path(@site_configuration), :method => "post" do
      assert_select "input#site_configuration_location_name", :name => "site_configuration[location_name]"
      assert_select "input#site_configuration_image_file_id", :name => "site_configuration[image_file_id]"
      assert_select "input#site_configuration_logo_text", :name => "site_configuration[logo_text]"
      assert_select "input#site_configuration_logo_text_color", :name => "site_configuration[logo_text_color]"
      assert_select "input#site_configuration_top_bar_gradient_start_color", :name => "site_configuration[top_bar_gradient_start_color]"
      assert_select "input#site_configuration_top_bar_gradient_end_color", :name => "site_configuration[top_bar_gradient_end_color]"
      assert_select "input#site_configuration_secondary_bar_gradient_start_color", :name => "site_configuration[secondary_bar_gradient_start_color]"
      assert_select "input#site_configuration_secondary_bar_gradient_end_color", :name => "site_configuration[secondary_bar_gradient_end_color]"
      assert_select "input#site_configuration_page_background_color", :name => "site_configuration[page_background_color]"
      assert_select "input#site_configuration_secondary_header_text_color", :name => "site_configuration[secondary_header_text_color]"
      assert_select "input#site_configuration_page_background_color", :name => "site_configuration[page_background_color]"
      assert_select "input#site_configuration_patient_info_box_background_color", :name => "site_configuration[patient_info_box_background_color]"
    end
  end
end
