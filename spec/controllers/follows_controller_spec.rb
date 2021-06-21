require 'rails_helper'

RSpec.describe FollowsController, type: :controller do

  describe "GET #follow" do
    it "returns http success" do
      get :follow
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #followed" do
    it "returns http success" do
      get :followed
      expect(response).to have_http_status(:success)
    end
  end

end
