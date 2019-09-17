class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_weather, :hourly, :daily
end
