class Forecast
  def initialize(weather_data)
    @currently = weather_data[:currently]
    @hourly = weather_data[:hourly][:data]
    @daily = weather_data[:daily][:data]
  end


  def current_weather
   filter = @currently.keep_if do |k,v|
     ([:time, :summary,:icon, :temperature, :humidity,:uvIndex,:visibility]).include?(k)
    end
  end

  def eight_hour_forecast

   filter = @hourly[0..7].map do |hour|
     hour.keep_if do |k,v|
     ([:time, :icon, :summary]).include?(k)
   end
 end
  end

  def eight_day_forecast
   filter = @daily[0..7].map do |day|
     day.keep_if do |k,v|
     ([:time,:summary, :icon, :precipProbability, :precipType, :temperatureHigh, :temperatureLow]).include?(k)
   end
 end
  end


  # def daily_weather
  #   filter = @daily.keep_if  do |k,v|
  #     (:time, :summary,:icon, :temperature, :humidity,:uvIndex,:visibility)
  # end

end
