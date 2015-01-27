defmodule HttpRouter.Mixfile do
  use Mix.Project

  def project do
    [ app: :http_router,
      version: "0.0.1",
      elixir: "~> 1.0",
      deps: deps,
      name: "HttpRouter",
      package: package,
      description: description,
      docs: [ readme: "README.md", main: "README" ],
      test_coverage: [ tool: ExCoveralls ] ]
  end

  def application do
    [ applications: [ :logger, :poison, :cowboy, :plug,
                      :xml_builder] ]
  end

  defp deps do
    [ { :cowboy, "~> 1.0.0" },
      { :plug, "~> 0.9.0" },
      { :poison, "~> 1.2.0" },
      { :xml_builder, "~> 0.0.5" },
      { :earmark, "~> 0.1.10", only: :docs },
      { :ex_doc, "~> 0.6.1", only: :docs },
      { :excoveralls, "~> 0.3.4", only: :test },
      { :dialyze, "~> 0.1.3", only: :test } ]
  end

  defp description do
    """
    HTTP Router with various macros to assist in
    developing your application and organizing
    your code
    """
  end

  defp package do
    %{ contributors: [ "Shane Logsdon" ],
       licenses: [ "MIT" ],
       links: %{ "GitHub" => "https://github.com/slogsdon/elixir-http-router" } }
  end
end
