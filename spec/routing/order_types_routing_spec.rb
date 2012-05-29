require "spec_helper"

describe OrderTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/order_types").should route_to("order_types#index")
    end

    it "routes to #new" do
      get("/order_types/new").should route_to("order_types#new")
    end

    it "routes to #show" do
      get("/order_types/1").should route_to("order_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/order_types/1/edit").should route_to("order_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/order_types").should route_to("order_types#create")
    end

    it "routes to #update" do
      put("/order_types/1").should route_to("order_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/order_types/1").should route_to("order_types#destroy", :id => "1")
    end

  end
end
