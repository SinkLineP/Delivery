
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

    respond_to do |format|
      if @delivery.save!
        format.html { redirect_to deliveries_path }
        # format.json  { render json: { delivery: @delivery}, status: :ok }
      else
        format.html { redirect_to new_delivery_path }
        # format.json { render json: { error: 'error' }, status: 303 }
      end
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