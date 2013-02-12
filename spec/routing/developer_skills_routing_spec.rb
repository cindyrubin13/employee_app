require "spec_helper"

describe DeveloperSkillsController do
  describe "routing" do

    it "routes to #index" do
      get("/developer_skills").should route_to("developer_skills#index")
    end

    it "routes to #new" do
      get("/developer_skills/new").should route_to("developer_skills#new")
    end

    it "routes to #show" do
      get("/developer_skills/1").should route_to("developer_skills#show", :id => "1")
    end

    it "routes to #edit" do
      get("/developer_skills/1/edit").should route_to("developer_skills#edit", :id => "1")
    end

    it "routes to #create" do
      post("/developer_skills").should route_to("developer_skills#create")
    end

    it "routes to #update" do
      put("/developer_skills/1").should route_to("developer_skills#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/developer_skills/1").should route_to("developer_skills#destroy", :id => "1")
    end

  end
end
