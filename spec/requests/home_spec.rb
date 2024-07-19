require 'rails_helper'

RSpec.describe "Homes", type: :request do
  include Devise::Test::IntegrationHelpers

  describe "GET /index" do
    describe "when user is not logged in" do
      it "redirects to the login page" do
        get root_path
        expect(response).to have_http_status(:found)
      end
    end

    describe "when user is logged in" do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it "returns http success" do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
