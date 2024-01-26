class DeliveryCalculator
  API_KEY = 'HRtR3u6B0hcVP7lv0cEGlg5R3jXO6pryKDaetrZluubnLryevRnxED6uwRLjvldm'.freeze

  attr_accessor :weight, :length, :width, :height, :origin, :destination

  def initialize(weight, length, width, height, origin, destination)
    @weight = weight.to_i
    @length = length.to_i
    @width = width.to_i
    @height = height.to_i
    @origin = origin
    @destination = destination
  end

  def call
    calculate_distance
  end

  def calculate_distance
    response = RestClient.get "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{@origin}&destinations=#{@destination}&key=#{API_KEY}"
    distance_data = JSON.parse(response.body)
    distance = distance_in_kilometers(distance_data)

    {
      weight: @weight,
      length: @length,
      width: @width,
      height: @height,
      distance: distance,
      price: calculate_price(distance)
    }
  end

  private

  def calculate_price(distance)
    volume = @length * @width * @height / 1000000.0
    price_per_km =
      if volume < 1
        1
      elsif @weight <= 10
        2
      else
        3
      end

    distance * price_per_km
  end

  def distance_in_kilometers(distance_data)
    distance_data["rows"][0]["elements"][0]["distance"]["value"] / 1000
  end
end


