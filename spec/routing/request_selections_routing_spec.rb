require "spec_helper"

describe RequestSelectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/request_selections").should route_to("request_selections#index")
    end

    it "routes to #new" do
      get("/request_selections/new").should route_to("request_selections#new")
    end

    it "routes to #show" do
      get("/request_selections/1").should route_to("request_selections#show", :id => "1")
    end

    it "routes to #edit" do
      get("/request_selections/1/edit").should route_to("request_selections#edit", :id => "1")
    end

    it "routes to #create" do
      post("/request_selections").should route_to("request_selections#create")
    end

    it "routes to #update" do
      put("/request_selections/1").should route_to("request_selections#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/request_selections/1").should route_to("request_selections#destroy", :id => "1")
    end

  end
end
