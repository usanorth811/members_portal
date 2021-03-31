require 'rails_helper'

RSpec.describe "ConcernedCitizenTickets", type: :request do
  describe "GET /concerned_citizen_tickets" do
    it "works! (now write some real specs)" do
      get concerned_citizen_tickets_path
      expect(response).to have_http_status(200)
    end
  end
end
