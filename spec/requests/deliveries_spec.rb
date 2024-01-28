require 'rails_helper'

RSpec.describe "Deliveries", type: :request do
  describe "Delivery Controller"  do # Описание контроллера Delivery
    let(:delivery_params) do # Определение параметров доставки
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

    context "GET index" do # Контекст для тестирования GET index
      it "returns a successful response" do # Проверка успешного ответа
        get "/"
        expect(response).to have_http_status(200)
      end

      it "assigns @deliveries" do # Проверка присвоения переменной @deliveries
        get "/"
        expect(assigns(:deliveries)).to_not be_nil
      end

      it "renders the index template" do # Проверка, что отображается шаблон index
        get "/"
        expect(response).to render_template(:index)
      end
    end

    context "GET new" do # Контекст для тестирования GET new
      it "returns a successful response" do # Проверка успешного ответа
        get "/deliveries/new"
        expect(response).to have_http_status(200)
      end

      it "assigns @delivery" do # Проверка присвоения переменной @delivery
        get "/deliveries/new"
        expect(assigns(:delivery)).to_not be_nil
      end

      it "renders the new template" do # Проверка, что отображается шаблон new
        get "/deliveries/new"
        expect(response).to render_template(:new)
      end
    end

    context "POST create" do # Контекст для тестирования POST create
      it "creates a delivery with valid params" do # Проверка создания доставки с валидными параметрами
        expect {
          post "/deliveries", params: { delivery: delivery_params }
        }.to change(Delivery, :count).by(1)
      end

      it "does not create a delivery with invalid params" do # Проверка, что доставка не создается с невалидными параметрами
        expect {
          post "/deliveries", params: {}
        }.to change(Delivery, :count).by(0)
      end
    end
  end
end
