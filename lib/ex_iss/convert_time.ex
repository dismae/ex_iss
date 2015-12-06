defmodule ExISS.ConvertTime do
  @epoch :calendar.datetime_to_gregorian_seconds({{1970, 1, 1}, {0, 0, 0}})

  def from_timestamp(stamp), do: :calendar.gregorian_seconds_to_datetime(stamp + @epoch)
  def to_date({{year, month, day}, {hours, minutes, seconds}}) do
    "#{day}.#{month}.#{year}, #{hours}:#{minutes}"
  end
  def from_ts_to_date(stamp) do
    stamp
    |> from_timestamp
    |> to_date
  end

  def to_minutes(seconds), do: "#{round(seconds/60)} minutes"

end
