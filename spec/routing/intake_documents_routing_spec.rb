require "spec_helper"

describe IntakeDocumentsController do
  describe "routing" do

    it "routes to #index" do
      get("/intake_documents").should route_to("intake_documents#index")
    end

    it "routes to #new" do
      get("/intake_documents/new").should route_to("intake_documents#new")
    end

    it "routes to #show" do
      get("/intake_documents/1").should route_to("intake_documents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/intake_documents/1/edit").should route_to("intake_documents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/intake_documents").should route_to("intake_documents#create")
    end

    it "routes to #update" do
      put("/intake_documents/1").should route_to("intake_documents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/intake_documents/1").should route_to("intake_documents#destroy", :id => "1")
    end

  end
end
