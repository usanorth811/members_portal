require 'rails_helper'

RSpec.describe "Codestatuses", type: :request do
  describe "GET /codestatuses" do
    it "works! (now write some real specs)" do
      get codestatuses_path
      expect(response).to have_http_status(200)
    end
  end
end
