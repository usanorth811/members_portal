require 'rails_helper'

RSpec.describe "DeleteRequests", type: :request do
  describe "GET /delete_requests" do
    it "works! (now write some real specs)" do
      get delete_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
