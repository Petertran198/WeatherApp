class WelcomeController < ApplicationController

  def test
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=27615,us&units=imperial&appid=#{ENV['openweather_api_key']}")
    @location = response["name"]
    @temp = response["main"]["temp"]
    @cloudiness = response["clouds"]["all"]
    @weather_icon = response["weather"][0]["icon"]
    @weather_description = response["weather"][0]["description"]
    @windiness = response["wind"]["speed"]
  end


  def index
    if params[:zip] != nil && params[:zip] != ""
      response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{params[:zip]},us&units=imperial&appid=#{ENV['openweather_api_key']}")
      @status = response["cod"] 
      if @status != "404" && @status != "400"
        @location = response["name"]
        @temp = response["main"]["temp"]
        @cloudiness = response["clouds"]["all"]
        @weather_icon = response["weather"][0]["icon"]
        @weather_description = response["weather"][0]["description"]
        @windiness = response["wind"]["speed"]
        @zip = City.pluck(:zip)
        if !@zip.include?(params{:zip})
          City.create(zip: params[:zip], location: @location)
        end
      elsif @status == "404" || @status == "400"
        @error = response["message"]
      end
    end
  end

  def previous_cities 
    @cities = City.all 
  end

  def city 
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{params[:zip]},us&units=imperial&appid=#{ENV['openweather_api_key']}")
    @status = response["cod"] 
    @location = response["name"]
    @temp = response["main"]["temp"]
    @cloudiness = response["clouds"]["all"]
    @weather_icon = response["weather"][0]["icon"]
    @weather_description = response["weather"][0]["description"]
    @windiness = response["wind"]["speed"]
  end

  
end
