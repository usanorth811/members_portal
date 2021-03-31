require "rails_helper"

RSpec.describe ConcernedCitizenTicketsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/concerned_citizen_tickets").to route_to("concerned_citizen_tickets#index")
    end

    it "routes to #new" do
      expect(:get => "/concerned_citizen_tickets/new").to route_to("concerned_citizen_tickets#new")
    end

    it "routes to #show" do
      expect(:get => "/concerned_citizen_tickets/1").to route_to("concerned_citizen_tickets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/concerned_citizen_tickets/1/edit").to route_to("concerned_citizen_tickets#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/concerned_citizen_tickets").to route_to("concerned_citizen_tickets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/concerned_citizen_tickets/1").to route_to("concerned_citizen_tickets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/concerned_citizen_tickets/1").to route_to("concerned_citizen_tickets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/concerned_citizen_tickets/1").to route_to("concerned_citizen_tickets#destroy", :id => "1")
    end
  end
end
