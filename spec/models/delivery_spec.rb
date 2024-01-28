require 'rails_helper'

RSpec.describe Delivery, type: :model do
  subject(:delivery) do
    described_class.new(
      name: "John",
      lastname: "Doe",
      surname: "Jr",
      phone: "123456789",
      email: "john@example.com",
      weight: 10,
      length: 50,
      width: 50,
      height: 50,
      price: 100,
      distance: 500,
      departure_point: "City A",
      destination: "City B"
    )
  end

  describe "check for an empty value" do
    it "is valid with valid attributes" do
      expect(delivery).to be_valid
    end

    it "is not valid without a name" do
      delivery.name = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a lastname" do
      delivery.lastname = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a surname" do
      delivery.surname = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a phone" do
      delivery.phone = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a email" do
      delivery.phone = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a weight" do
      delivery.phone = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a length" do
      delivery.phone = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a width" do
      delivery.phone = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a height" do
      delivery.phone = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a price" do
      delivery.phone = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a distance" do
      delivery.phone = nil
      expect(delivery).to_not be_valid
    end

    it "is not valid without a destination" do
      delivery.destination = nil
      expect(delivery).to_not be_valid
    end
  end

  describe "check correctly data" do
    it "check if the phone is the correct length" do
      rand_phone = "7#{rand(11111111..99999999)}"
      delivery.phone = rand_phone
      expect(delivery.phone.length).to eq(9)
    end
  end
end
