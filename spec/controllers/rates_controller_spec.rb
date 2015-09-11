require 'rails_helper'

RSpec.describe RatesController, type: :controller do
  let(:my_rate) { Rate.create!(name: "R1") }
  describe "GET #show" do
    it "returns http success" do
      get :show, { id: my_rate.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, { id: my_rate.id }
      expect(response).to render_template :show
    end

    it "assigns my_rate to @rate" do
     get :show, id: my_rate.id
     expect(assigns(:rate)).to eq(my_rate)
    end
  end

end
