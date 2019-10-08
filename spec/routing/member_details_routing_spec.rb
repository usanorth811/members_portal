require "rails_helper"

RSpec.describe MemberDetailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/member_details").to route_to("member_details#index")
    end

    it "routes to #new" do
      expect(:get => "/member_details/new").to route_to("member_details#new")
    end

    it "routes to #show" do
      expect(:get => "/member_details/1").to route_to("member_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/member_details/1/edit").to route_to("member_details#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/member_details").to route_to("member_details#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/member_details/1").to route_to("member_details#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/member_details/1").to route_to("member_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/member_details/1").to route_to("member_details#destroy", :id => "1")
    end
  end
end
