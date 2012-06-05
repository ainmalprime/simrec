require "spec_helper"

describe LabReportTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/lab_report_templates").should route_to("lab_report_templates#index")
    end

    it "routes to #new" do
      get("/lab_report_templates/new").should route_to("lab_report_templates#new")
    end

    it "routes to #show" do
      get("/lab_report_templates/1").should route_to("lab_report_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lab_report_templates/1/edit").should route_to("lab_report_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lab_report_templates").should route_to("lab_report_templates#create")
    end

    it "routes to #update" do
      put("/lab_report_templates/1").should route_to("lab_report_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lab_report_templates/1").should route_to("lab_report_templates#destroy", :id => "1")
    end

  end
end
