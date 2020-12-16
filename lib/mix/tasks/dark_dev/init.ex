defmodule Mix.Tasks.DarkDev.Init do
  @moduledoc """
  Setup initial configs.
  """
  @shortdoc "Setup initial configs"
  @preferred_cli_env :dev

  use Mix.Task

  @regex_mix_project_app ~r/\s+app:\s+\:([a-z_]+),?\s+/
  @regex_mix_project_module ~r/(\S+)(?=\.)/

  @template_dir Path.expand("priv/templates/")

  @templates [
    mix: {"mix.exs.eex", "mix.exs"},
    check: {".check.exs.eex", ".check.exs"},
    credo: {".credo.exs.eex", ".credo.exs"},
    dialyzer_ignore: {".dialyzer_ignore.exs.eex", ".dialyzer_ignore.exs"},
    formatter: {".formatter.exs.eex", ".formatter.exs"},
    gitignore: {".gitignore.eex", ".gitignore"},
    sobelow: {".sobelow-conf.eex", ".sobelow-conf"},
    tool_versions: {".tool-versions.eex", ".tool-versions"}
  ]

  @type args() :: Keyword.t()
  @type assigns() :: Keyword.t()

  @doc """
  Setup all dependency configs.
  """
  @impl Mix.Task
  @spec run(args) :: :ok
  def run(args \\ []) when is_list(args) do
    args
    |> build_assigns()
    |> write!()
  end

  @spec build_assigns(args()) :: assigns()
  def build_assigns(args) when is_list(args) do
    [
      project: %{
        app: read_mix_project_app(),
        module: read_mix_project_module()
      }
    ]
  end

  @doc """
  Setup dependency specific configs
  """
  @spec write!(assigns()) :: :ok | no_return()
  def write!(assigns) when is_list(assigns) do
    for {_name, {template, dest}} <- @templates do
      contents =
        @template_dir
        |> Path.join(template)
        |> File.read!()
        |> EEx.eval_string(assigns: assigns)

      File.write!(dest, contents)
    end

    :ok
  end

  defp read_mix_project_app do
    contents = File.read!("mix.exs")
    [app] = Regex.run(@regex_mix_project_app, contents, capture: :all_but_first)
    app
  end

  defp read_mix_project_module do
    line = "mix.exs" |> File.stream!() |> Enum.take(1) |> to_string()
    [module] = Regex.run(@regex_mix_project_module, line, capture: :all_but_first)
    module
  end
end
