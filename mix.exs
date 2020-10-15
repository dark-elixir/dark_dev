defmodule DarkDev.MixProject do
  @moduledoc """
  Mix Project for `DarkDev`.
  """

  use Mix.Project

  @version "1.0.4"
  @name "DarkDev"
  @hexpm_url "http://hexdocs.pm/dark_dev"
  @github_url "https://github.com/dark-elixir/dark_dev"
  @description "Libraries and utils for general elixir development."

  def project do
    [
      app: :dark_dev,
      version: @version,
      elixir: "~>1.10",
      deps: deps(),
      start_permanent: Mix.env() == :prod,
      dialyzer: [plt_add_apps: [:mix, :eex]],

      # Hex
      description: @description,
      package: package(),
      source_url: @github_url,

      # Docs
      name: @name,
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
      {:ex_check, ">= 0.0.0", runtime: false},
      {:credo, ">= 0.0.0", runtime: false},
      {:credo_naming, ">= 0.0.0", runtime: false},
      {:credo_contrib, ">= 0.0.0", runtime: false},
      {:dialyxir, ">= 0.0.0", runtime: false},
      {:ex_doc, ">= 0.0.0", runtime: false},
      {:sobelow, ">= 0.0.0", runtime: false},

      # Testing
      {:mix_test_watch, ">= 0.0.0", runtime: false}
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
      main: @name,
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
      # Introduction: ~r/guides\/introduction\/.?/,
    ]
  end
end
