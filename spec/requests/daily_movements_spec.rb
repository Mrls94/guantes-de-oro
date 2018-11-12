require 'rails_helper'

RSpec.describe "DailyMovements", type: :request do
  describe "GET /daily_movements" do
    it "works! (now write some real specs)" do
      get daily_movements_path
      expect(response).to have_http_status(200)
    end
  end
end
