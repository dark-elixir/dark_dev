defmodule Mix.Tasks.DarkDev.DevSetup do
  @moduledoc """
  Setup initial configs.
  """

  use Mix.Task

  @type dark_dev_dependency() ::
          :credo
          | :credo_contrib
          | :credo_naming
          | :dialyzer
          | :ex_check
          | :ex_doc
          | :mix_test_watch
          | :sobelow

  @type args() :: Keyword.t()

  @doc """
  Setup all dependency configs.
  """
  @impl Mix.Task
  @spec run(args) :: :ok
  def run(args \\ []) when is_list(args) do
    :ok = run_setup(:credo)
    :ok = run_setup(:credo_contrib)
    :ok = run_setup(:credo_naming)
    :ok = run_setup(:dialyzer)
    :ok = run_setup(:ex_check)
    :ok = run_setup(:ex_doc)
    :ok = run_setup(:mix_test_watch)
    :ok = run_setup(:sobelow)
  end

  @doc """
  Setup dependency specific configs
  """
  @spec run_setup(dark_dev_dependency()) :: :ok
  def run_setup(:credo) do
    :ok
  end

  def run_setup(:credo_contrib) do
    :ok
  end

  def run_setup(:credo_naming) do
    :ok
  end

  def run_setup(:dialyzer) do
    # "touch '.dialyzer_ignore.exs'"
    :ok
  end

  def run_setup(:ex_check) do
    # "mix check.gen.config"
    :ok
  end

  def run_setup(:ex_doc) do
    :ok
  end

  def run_setup(:mix_test_watch) do
    :ok
  end

  def run_setup(:sobelow) do
    # "mix sobelow --save-config"
    :ok
  end
end
