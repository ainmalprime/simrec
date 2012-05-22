require "spec_helper"

describe ClinicianOrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/clinician_orders").should route_to("clinician_orders#index")
    end

    it "routes to #new" do
      get("/clinician_orders/new").should route_to("clinician_orders#new")
    end

    it "routes to #show" do
      get("/clinician_orders/1").should route_to("clinician_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/clinician_orders/1/edit").should route_to("clinician_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/clinician_orders").should route_to("clinician_orders#create")
    end

    it "routes to #update" do
      put("/clinician_orders/1").should route_to("clinician_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clinician_orders/1").should route_to("clinician_orders#destroy", :id => "1")
    end

  end
end
