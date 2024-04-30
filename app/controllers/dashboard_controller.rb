class DashboardController < ApplicationController
  include HTTParty

  def index
    @city = params[:city]
    response = HTTParty.get("http://api.weatherapi.com/v1/current.json?key= 5645b06a6d3a4139817222521242904&q=#{@city}")

    if response.success?
      @weather_data = JSON.parse(response.body)
    else
      flash[:alert] = "Error fetching weather data. Please try again later."
      @weather_data = nil
    end
  rescue JSON::ParserError => e
    flash[:alert] = "Error parsing weather data. Please try again later."
    @weather_data = nil
  end
end
