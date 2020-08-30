defmodule DarkDev.MixProject do
  @moduledoc """
  Mix Project for `DarkDev`.
  """

  use Mix.Project

  @version "1.0.0"
  @hexpm_url "http://hexdocs.pm/dark-elixir/dark_dev"
  @github_url "https://github.com/dark-elixir/dark_dev"
  @description "Libraries and utils for general elixir development."

  def project do
    [
      app: :dark_dev,
      version: @version,
      elixir: "~>1.10",
      deps: deps(),
      start_permanent: Mix.env() == :prod,
      dialyzer: [plt_add_apps: [:mix]],

      # Hex
      description: @description,
      package: package(),
      source_url: @github_url,

      # Docs
      name: "DarkDev",
      docs: docs()
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

  defp package() do
    [
      maintainers: ["Michael Sitchenko"],
      files: ~w(lib priv .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @github_url}
    ]
  end

  defp docs do
    [
      main: "DarkDev",
      source_ref: "v#{@version}",
      canonical: @hexpm_url,
      logo: "guides/images/dark-elixir.png",
      extra_section: "GUIDES",
      source_url: @github_url,
      extras: extras(),
      groups_for_extras: groups_for_extras(),
      groups_for_modules: []
    ]
  end

  def extras() do
    [
      # "guides/introduction/Getting Started.md",
      "README.md"
    ]
  end

  defp groups_for_extras do
    [
      Introduction: ~r/guides\/introduction\/.?/,
      "How-To's": ~r/guides\/howtos\/.?/
    ]
  end
end
