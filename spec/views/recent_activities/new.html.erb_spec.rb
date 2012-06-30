require 'spec_helper'

describe "recent_activities/new" do
  before(:each) do
    assign(:recent_activity, stub_model(RecentActivity,
      :description => "MyString",
      :resource => "MyString",
      :resource_id => 1
    ).as_new_record)
  end

  it "renders new recent_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recent_activities_path, :method => "post" do
      assert_select "input#recent_activity_description", :name => "recent_activity[description]"
      assert_select "input#recent_activity_resource", :name => "recent_activity[resource]"
      assert_select "input#recent_activity_resource_id", :name => "recent_activity[resource_id]"
    end
  end
end
