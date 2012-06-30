require 'spec_helper'

describe "recent_activities/edit" do
  before(:each) do
    @recent_activity = assign(:recent_activity, stub_model(RecentActivity,
      :description => "MyString",
      :resource => "MyString",
      :resource_id => 1
    ))
  end

  it "renders the edit recent_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recent_activities_path(@recent_activity), :method => "post" do
      assert_select "input#recent_activity_description", :name => "recent_activity[description]"
      assert_select "input#recent_activity_resource", :name => "recent_activity[resource]"
      assert_select "input#recent_activity_resource_id", :name => "recent_activity[resource_id]"
    end
  end
end
