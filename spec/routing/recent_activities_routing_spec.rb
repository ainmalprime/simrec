require "spec_helper"

describe RecentActivitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/recent_activities").should route_to("recent_activities#index")
    end

    it "routes to #new" do
      get("/recent_activities/new").should route_to("recent_activities#new")
    end

    it "routes to #show" do
      get("/recent_activities/1").should route_to("recent_activities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/recent_activities/1/edit").should route_to("recent_activities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/recent_activities").should route_to("recent_activities#create")
    end

    it "routes to #update" do
      put("/recent_activities/1").should route_to("recent_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/recent_activities/1").should route_to("recent_activities#destroy", :id => "1")
    end

  end
end
