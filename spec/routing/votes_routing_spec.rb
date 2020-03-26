require "rails_helper"

RSpec.describe VotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/votes").not_to be_routable
    end

    it "routes to #new" do
      expect(:get => "/votes/new").not_to be_routable
    end

    it "routes to #show" do
      expect(:get => "/votes/1").not_to be_routable
    end

    it "routes to #edit" do
      expect(:get => "/votes/1/edit").not_to be_routable
    end


    it "routes to #create" do
      expect(:post => "/votes").to route_to("votes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/votes/1").to route_to("votes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/votes/1").to route_to("votes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/votes/1").to route_to("votes#destroy", :id => "1")
    end
  end
end
