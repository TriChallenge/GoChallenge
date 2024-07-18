require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    context "when user is not logged in" do
      it "redirects to the login page" do
        get root_path
        expect(response).to have_http_status(:found)
      end
    end

    context "when user is logged in" do
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
