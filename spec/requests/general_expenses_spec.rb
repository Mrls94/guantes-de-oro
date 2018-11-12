require 'rails_helper'

RSpec.describe "GeneralExpenses", type: :request do
  describe "GET /general_expenses" do
    it "works! (now write some real specs)" do
      get general_expenses_path
      expect(response).to have_http_status(200)
    end
  end
end
