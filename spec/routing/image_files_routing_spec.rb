require "spec_helper"

describe ImageFilesController do
  describe "routing" do

    it "routes to #index" do
      get("/image_files").should route_to("image_files#index")
    end

    it "routes to #new" do
      get("/image_files/new").should route_to("image_files#new")
    end

    it "routes to #show" do
      get("/image_files/1").should route_to("image_files#show", :id => "1")
    end

    it "routes to #edit" do
      get("/image_files/1/edit").should route_to("image_files#edit", :id => "1")
    end

    it "routes to #create" do
      post("/image_files").should route_to("image_files#create")
    end

    it "routes to #update" do
      put("/image_files/1").should route_to("image_files#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/image_files/1").should route_to("image_files#destroy", :id => "1")
    end

  end
end
