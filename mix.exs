defmodule DarkDev.MixProject do
  @moduledoc """
  Mix Project for `DarkDev`.
  """

  use Mix.Project

  @version "1.0.8"

  @app :dark_dev
  @name "DarkDev"
  @github_organization "dark-elixir"
  @hexpm_url "http://hexdocs.pm/#{@app}"
  @github_url "https://github.com/#{@github_organization}/#{@app}"
  @maintainers ["Michael Sitchenko"]
  @description "Libraries and utils for general elixir development."

  def project do
    [
      app: @app,
      version: @version,
      elixir: ">= 1.6.0",
      start_permanent: Mix.env() == :prod,
      dialyzer: [plt_add_apps: [:mix, :eex]],
      preferred_cli_env: preferred_cli_env(),
      dialyzer: dialyzer(),
      aliases: aliases(),
      package: package(),
      deps: deps()
    ] ++ docs()
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [extra_applications: [:logger]]
  end

  defp dialyzer do
    [
      plt_add_deps: :app_tree,
      plt_add_apps: [:ex_unit, :iex],
      ignore_warnings: ".dialyzer_ignore.exs",
      list_unused_filters: true,
      flags: [
        # Useful additions
        :error_handling,
        :no_opaque,
        :race_conditions,
        :underspecs,
        :unmatched_returns,

        # Strict (annoying / low-impact)
        :overspecs,
        :specdiffs,

        # Less common / potentially confusing
        # (Can disable without much consequence)
        :no_behaviours,
        :no_contracts,
        :no_fail_call,
        :no_fun_app,
        :no_improper_lists,
        :no_match,
        :no_missing_calls,
        :no_return,
        :no_undefined_callbacks,
        :no_unused,
        :unknown
      ]
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

  defp preferred_cli_env do
    [
      check: :test,
      credo: :test,
      dialyzer: :test,
      sobelow: :test
    ]
  end

  defp aliases do
    []
  end

  defp package() do
    [
      maintainers: @maintainers,
      files: ~w(lib priv .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @github_url}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      name: @name,
      main: @name,
      description: @description,
      canonical: @hexpm_url,
      source_url: @github_url,
      homepage_url: @github_url,
      docs: [
        logo: "guides/images/dark-elixir.png",
        extra_section: "GUIDES",
        extras: [
          "README.md"
          # "guides/introduction/Getting Started.md",
          # "docs/GLOSSARY.md",
          # "docs/OVERVIEW.md",
        ],
        groups_for_extras: [
          # Introduction: ~r/guides\/introduction\/.?/,
          # Domains: Path.wildcard("docs/domains/*.md"),
        ],
        groups_for_modules: []
      ]
    ]
  end
end
