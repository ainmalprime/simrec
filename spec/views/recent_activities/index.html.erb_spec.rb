require 'spec_helper'

describe "recent_activities/index" do
  before(:each) do
    assign(:recent_activities, [
      stub_model(RecentActivity,
        :description => "Description",
        :resource => "Resource",
        :resource_id => 1
      ),
      stub_model(RecentActivity,
        :description => "Description",
        :resource => "Resource",
        :resource_id => 1
      )
    ])
  end

  it "renders a list of recent_activities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Resource".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
