require "spec_helper"

describe FeedItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/feed_items").should route_to("feed_items#index")
    end

    it "routes to #new" do
      get("/feed_items/new").should route_to("feed_items#new")
    end

    it "routes to #show" do
      get("/feed_items/1").should route_to("feed_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feed_items/1/edit").should route_to("feed_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feed_items").should route_to("feed_items#create")
    end

    it "routes to #update" do
      put("/feed_items/1").should route_to("feed_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feed_items/1").should route_to("feed_items#destroy", :id => "1")
    end

  end
end
