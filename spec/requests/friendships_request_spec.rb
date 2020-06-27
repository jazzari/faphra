require 'rails_helper'

RSpec.describe "Friendships", type: :request do

  describe "GET /follow_user" do
    it "returns http success" do
      get "/friendships/follow_user"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /unfollow_user" do
    it "returns http success" do
      get "/friendships/unfollow_user"
      expect(response).to have_http_status(:success)
    end
  end

end
