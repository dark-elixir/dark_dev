defmodule DarkDev.MixProject do
  @moduledoc """
  `DarkDev`
  """

  use Mix.Project

  def project do
    [
      app: :dark_dev,
      version: "1.0.0",
      elixir: "~>1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Analysis
      {:ex_check, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:credo, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:credo_naming, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:credo_contrib, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:sobelow, ">= 0.0.0", only: [:dev, :test], runtime: false},

      # Testing
      {:mix_test_watch, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
