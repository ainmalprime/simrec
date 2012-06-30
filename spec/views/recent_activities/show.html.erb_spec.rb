require 'spec_helper'

describe "recent_activities/show" do
  before(:each) do
    @recent_activity = assign(:recent_activity, stub_model(RecentActivity,
      :description => "Description",
      :resource => "Resource",
      :resource_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/Resource/)
    rendered.should match(/1/)
  end
end
