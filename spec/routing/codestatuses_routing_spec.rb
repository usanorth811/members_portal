require "rails_helper"

RSpec.describe CodestatusesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/codestatuses").to route_to("codestatuses#index")
    end

    it "routes to #new" do
      expect(:get => "/codestatuses/new").to route_to("codestatuses#new")
    end

    it "routes to #show" do
      expect(:get => "/codestatuses/1").to route_to("codestatuses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/codestatuses/1/edit").to route_to("codestatuses#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/codestatuses").to route_to("codestatuses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/codestatuses/1").to route_to("codestatuses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/codestatuses/1").to route_to("codestatuses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/codestatuses/1").to route_to("codestatuses#destroy", :id => "1")
    end
  end
end
