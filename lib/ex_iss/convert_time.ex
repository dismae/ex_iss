defmodule ExISS.ConvertTime do
  @epoch :calendar.datetime_to_gregorian_seconds({{1970, 1, 1}, {0, 0, 0}})
  @moduledoc """
  This module is meant only for converting times for the purpose of this library.
  Use these functions at your own risk! This is not meant to stand alone. 
  """

  def from_timestamp(stamp), do: :calendar.gregorian_seconds_to_datetime(stamp + @epoch)
  def to_date({{year, month, day}, {hours, minutes, seconds}}) do
    "#{day}.#{month}.#{year}, #{hours}:#{minutes}, UTC."
  end
  def from_ts_to_date(stamp) do
    stamp
    |> from_timestamp
    |> to_date
  end

  def to_minutes(seconds), do: "#{round(seconds/60)} minutes"

end
