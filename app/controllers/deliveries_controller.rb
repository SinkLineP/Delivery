
class DeliveriesController < ApplicationController
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

    # binding.pry

    if @delivery.save!
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def show
    @delivery = Delivery.find_by(params[:id])
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