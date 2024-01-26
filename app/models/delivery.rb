class Delivery < ApplicationRecord
  validates :name, presence: true
  validates :lastname, presence: true
  validates :surname, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :weight, presence: true
  validates :length, presence: true
  validates :width, presence: true
  validates :height, presence: true
  validates :price, presence: true
  validates :distance, presence: true
  validates :departure_point, presence: true
  validates :destination, presence: true
end
