require "rails_helper"

RSpec.describe DeleteRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/delete_requests").to route_to("delete_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/delete_requests/new").to route_to("delete_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/delete_requests/1").to route_to("delete_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/delete_requests/1/edit").to route_to("delete_requests#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/delete_requests").to route_to("delete_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/delete_requests/1").to route_to("delete_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/delete_requests/1").to route_to("delete_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/delete_requests/1").to route_to("delete_requests#destroy", :id => "1")
    end
  end
end
