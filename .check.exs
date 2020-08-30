[
  ## all available options with default values (see `mix check` docs for description)
  parallel: true,
  skipped: true,

  ## list of tools (see `mix check` docs for a list of default curated tools)
  tools: [
    {:formatter, true},
    {:compiler, true},
    {:sobelow, command: "mix sobelow --config"},
    {:credo, command: "mix credo --strict"},
    {:dialyzer, true},
    {:ex_doc, true},
    {:ex_unit, true}
  ]
]
