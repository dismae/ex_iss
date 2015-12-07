defmodule ExISS.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_iss,
     version: "1.0.0",
     elixir: "~> 1.1",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp description do
    """
    This package is for interfacing with the Open Notify API to information such
    as the ISS's current location, crew, and when it will pass over a location.
    """
  end
  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:poison,    "~> 1.5"},
      {:credo,     "~> 0.1.9", only: [:dev, :test]}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Ethan Parrott"],
      links: %{"GitHub" => "https://github.com/cryptobird/ex_iss"},
      licenses: ["DO WHAT THE F*CK YOU WANT TO PUBLIC LICENSE "]
    ]
  end
end
