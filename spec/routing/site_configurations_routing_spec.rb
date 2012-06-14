require "spec_helper"

describe SiteConfigurationsController do
  describe "routing" do

    it "routes to #index" do
      get("/site_configurations").should route_to("site_configurations#index")
    end

    it "routes to #new" do
      get("/site_configurations/new").should route_to("site_configurations#new")
    end

    it "routes to #show" do
      get("/site_configurations/1").should route_to("site_configurations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/site_configurations/1/edit").should route_to("site_configurations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/site_configurations").should route_to("site_configurations#create")
    end

    it "routes to #update" do
      put("/site_configurations/1").should route_to("site_configurations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/site_configurations/1").should route_to("site_configurations#destroy", :id => "1")
    end

  end
end
