require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #results" do
  #   it "returns http success" do
  #     get :results
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
