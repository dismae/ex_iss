defmodule ExISS.Handlers do
  @atoms [:latitude, :longitude, :name, :number, :date, :time, :iss_location,
          :people, :response, :duration, :risetime, :craft]
  @moduledoc """
  This module defines handlers and helpers for the functions in ExISS. None of these functions are meant for use outside of this library. Use at your own risk. 
  """
  def fetch(thing) do
    HTTPoison.get(thing)
    |> handle_response
    |> process
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}), do: Poison.decode body
  def handle_response({:ok, %HTTPoison.Response{status_code: ___, body: body}}), do: Poison.decode body
  def handle_response({:error, %HTTPoison.Error{id: _, reason: reason,}}), do: reason

  defp process({:ok, map}), do: to_key_map map

  def to_key_map(map), do: Enum.map(map, fn{k, v} -> {String.to_existing_atom(k), v} end )

  def key_loop(list), do: key_loop(list, [])
  defp key_loop([], result), do: result
  defp key_loop([h | t], result), do: key_loop(t, [to_key_map(h) | result])

  def astro_key_loop(list), do: astro_key_loop(list, [])
  defp astro_key_loop([], result), do: result
  defp astro_key_loop([h | t], result), do: astro_key_loop(t, [to_key_map(h)[:name] | result])


end
