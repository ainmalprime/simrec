require "spec_helper"

describe LabAndDiagnosticReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/lab_and_diagnostic_reports").should route_to("lab_and_diagnostic_reports#index")
    end

    it "routes to #new" do
      get("/lab_and_diagnostic_reports/new").should route_to("lab_and_diagnostic_reports#new")
    end

    it "routes to #show" do
      get("/lab_and_diagnostic_reports/1").should route_to("lab_and_diagnostic_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lab_and_diagnostic_reports/1/edit").should route_to("lab_and_diagnostic_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lab_and_diagnostic_reports").should route_to("lab_and_diagnostic_reports#create")
    end

    it "routes to #update" do
      put("/lab_and_diagnostic_reports/1").should route_to("lab_and_diagnostic_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lab_and_diagnostic_reports/1").should route_to("lab_and_diagnostic_reports#destroy", :id => "1")
    end

  end
end
