require "spec_helper"

describe FlowSheetRecordsController do
  describe "routing" do

    it "routes to #index" do
      get("/flow_sheet_records").should route_to("flow_sheet_records#index")
    end

    it "routes to #new" do
      get("/flow_sheet_records/new").should route_to("flow_sheet_records#new")
    end

    it "routes to #show" do
      get("/flow_sheet_records/1").should route_to("flow_sheet_records#show", :id => "1")
    end

    it "routes to #edit" do
      get("/flow_sheet_records/1/edit").should route_to("flow_sheet_records#edit", :id => "1")
    end

    it "routes to #create" do
      post("/flow_sheet_records").should route_to("flow_sheet_records#create")
    end

    it "routes to #update" do
      put("/flow_sheet_records/1").should route_to("flow_sheet_records#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/flow_sheet_records/1").should route_to("flow_sheet_records#destroy", :id => "1")
    end

  end
end
