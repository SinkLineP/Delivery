
class DeliveriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @deliveries = Delivery.all
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    result = DeliveryCalculator.new(delivery_params[:weight], delivery_params[:length], delivery_params[:width], delivery_params[:height], delivery_params[:departure_point], delivery_params[:destination]).call

    @delivery.price = result[:price]
    @delivery.distance = result[:distance]


    if @delivery.save
      redirect_to deliveries_path, notice: "Спасибо за заявку!"
    else
      redirect_to new_delivery_path, notice: "Что-то пошло не так. Попробуйте еще раз!"
    end
  end

  private

  def delivery_params
    params.require(:delivery).permit(
      :name,
      :lastname, 
      :surname, 
      :phone, 
      :email, 
      :weight, 
      :height, 
      :width, 
      :length, 
      :departure_point, 
      :destination
    )
  end
end