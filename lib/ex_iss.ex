defmodule ExISS do
  @current_location "http://api.open-notify.org/iss-now.json"
  @people "http://api.open-notify.org/astros.json"
  @passes "http://api.open-notify.org/iss-pass.json?" #needs lat=LAT&lon=LON

  alias ExISS.Handlers
  alias ExISS.ConvertTime


  def current_location do
    Handlers.fetch(@current_location)[:iss_position]
    |> Handlers.to_key_map
  end

  def number_of_people do
    Handlers.fetch(@people)[:number]
  end

  def astronauts do
    Handlers.fetch(@people)[:people]
    |> Handlers.astro_key_loop
  end

  def next_pass(latitude, longitude) do
    Handlers.fetch("#{@passes}lat=#{latitude}&lon=#{longitude}&n=1")[:response]
    |> List.first
    |> Handlers.to_key_map
    |> readable
  end

  def readable([duration: seconds, risetime: timestamp]), do: [duration: ConvertTime.to_minutes(seconds), risetime: ConvertTime.from_ts_to_date(timestamp)]
end
