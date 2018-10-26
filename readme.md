This is a copy of the lib directory of the genstage_test project related to stack overflow question:

https://stackoverflow.com/questions/52968929/runtime-dynamic-compute-graph-using-elixir-genstage

mix.exs looks like this:
```
defmodule GenstageTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :genstage_test,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {GenstageTest.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gen_stage, "~> 0.11"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
```

Note the `gen_stage` dependency. 
