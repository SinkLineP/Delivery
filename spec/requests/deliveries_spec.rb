require 'rails_helper'

RSpec.describe "Deliveries", type: :request do
  describe "Delivery Controller"  do
    let(:delivery_params) do
      {
        name: "name",
        surname: "surname",
        lastname: "lastname",
        phone: "79998887766",
        email: "example@email.com",
        weight: 10,
        length: 50,
        width: 50,
        height: 50,
        departure_point: "moscow",
        destination: "krasnodar"
      }
    end

    context "GET index" do
      it "returns a successful response" do
        get "/"
        expect(response).to have_http_status(200)
      end

      it "assigns @deliveries" do
        get "/"
        expect(assigns(:deliveries)).to_not be_nil
      end

      it "renders the index template" do
        get "/"
        expect(response).to render_template(:index)
      end
    end

    context "GET new" do
      it "returns a successful response" do
        get "/deliveries/new"
        expect(response).to have_http_status(200)
      end

      it "assigns @delivery" do
        get "/deliveries/new"
        expect(assigns(:delivery)).to_not be_nil
      end

      it "renders the new template" do
        get "/deliveries/new"
        expect(response).to render_template(:new)
      end
    end

    context "POST create" do
      it "create delivery" do
        expect {
          post "/deliveries", params: { delivery: delivery_params }
        }.to change(Delivery, :count).by(1)
      end

      it "not create delivery" do
        expect {
          post "/deliveries", params: {}
        }.to change(Delivery, :count).by(0)
      end
    end
  end
end
