defmodule HttpRouter.Mixfile do
  use Mix.Project

  def project do
    [ app: :http_router,
      version: "0.10.0",
      elixir: "~> 1.0",
      deps: deps,
      name: "HttpRouter",
      package: package,
      description: description,
      docs: [ main: "HttpRouter" ],
      test_coverage: [ tool: ExCoveralls ] ]
  end

  def application do
    [ applications: [ :logger, :poison, :cowboy, :plug,
                      :xml_builder] ]
  end

  defp deps do
    [ { :cowboy, "~> 1.0" },
      { :plug, "~> 1.0" },
      { :poison, "~> 3.0" },
      { :xml_builder, "~> 0.0" },
      { :earmark, "~> 1.0", only: :dev },
      { :ex_doc, "~> 0.14", only: :dev },
      { :excoveralls, "~> 0.5", only: :test },
      { :dialyze, "~> 0.2", only: :test } ]
  end

  defp description do
    """
    HTTP Router with various macros to assist in
    developing your application and organizing
    your code
    """
  end

  defp package do
    %{ maintainers: [ "Shane Logsdon" ],
       licenses: [ "MIT" ],
       links: %{ "GitHub" => "https://github.com/sugar-framework/elixir-http-router" } }
  end
end
