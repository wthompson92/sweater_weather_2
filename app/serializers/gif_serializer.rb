class GifSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :daily_gifs
end
