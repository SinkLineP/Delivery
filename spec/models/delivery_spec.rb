require 'rails_helper'

RSpec.describe Delivery, type: :model do
  describe 'Delivery Model' do
    context "validate presence of" do # Проверка на наличие данных
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:lastname) }
      it { should validate_presence_of(:surname) }
      it { should validate_presence_of(:phone) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:weight) }
      it { should validate_presence_of(:length) }
      it { should validate_presence_of(:width) }
      it { should validate_presence_of(:height) }
      it { should validate_presence_of(:price) }
      it { should validate_presence_of(:distance) }
      it { should validate_presence_of(:departure_point) }
      it { should validate_presence_of(:destination) }
    end

    context 'have db column' do # Проверка на наличие колонок в базе
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:lastname).of_type(:string) }
      it { is_expected.to have_db_column(:surname).of_type(:string) }
      it { is_expected.to have_db_column(:phone).of_type(:string) }
      it { is_expected.to have_db_column(:email).of_type(:string) }
      it { is_expected.to have_db_column(:weight).of_type(:integer) }
      it { is_expected.to have_db_column(:length).of_type(:integer) }
      it { is_expected.to have_db_column(:width).of_type(:integer) }
      it { is_expected.to have_db_column(:height).of_type(:integer) }
      it { is_expected.to have_db_column(:price).of_type(:integer) }
      it { is_expected.to have_db_column(:distance).of_type(:integer) }
      it { is_expected.to have_db_column(:departure_point).of_type(:string) }
      it { is_expected.to have_db_column(:destination).of_type(:string) }
    end
  end
end
