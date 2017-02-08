# HttpRouter
[![Build Status](https://img.shields.io/travis/sugar-framework/elixir-http-router.svg?style=flat)](https://travis-ci.org/sugar-framework/elixir-http-router)
[![Coverage Status](https://img.shields.io/coveralls/sugar-framework/elixir-http-router.svg?style=flat)](https://coveralls.io/r/sugar-framework/elixir-http-router)
[![Hex.pm Version](http://img.shields.io/hexpm/v/http_router.svg?style=flat)](https://hex.pm/packages/http_router)
[![Inline docs](http://inch-ci.org/github/sugar-framework/elixir-http-router.svg?branch=master)](http://inch-ci.org/github/sugar-framework/elixir-http-router)

> HTTP Router with various macros to assist in
> developing your application and organizing
> your code

## Installation

Add the following line to your dependency list
in your `mix.exs` file, and run `mix deps.get`:

```elixir
{:http_router, "~> 0.0.1"}
```

Also, be sure to add `:http_router` to the list
of applications on which your web application
depends (the default looks something like
`applications: [:logger]`) in your `mix.exs`
file.

Be sure to have [Plug][plug] in your dependency
list as well as this is essentially a
reimagination of the `Plug.Router` module, and
as such, it still make use of a large portion
of the Plug library.

## Usage

To get the benefits that this package has to
offer, it is necessary to use the `HttpRouter`
module in one of your modules that you wish to
act as the router for your web application.
Similar to `Plug.Router`, we can start with a
simple module:

```elixir
defmodule MyRouter do
  use HttpRouter
end
```

That was easy, huh? Now, this module still needs a
few calls to the below macros, but this depends on
how your application needs to be structured.

### The Macros

Check out this convoluted example:

```elixir
defmodule MyRouter do
  use HttpRouter

  # Define one of the versions of the API
  # with a simple version number "1"
  # or following semver "1.0.0"
  # or date of release "2014-09-06"
  version "1" do
    # Define your routes here
    get  "/",               Handlers.V1.Pages, :index
    get  "/pages",          Handlers.V1.Pages, :create
    post "/pages",          Handlers.V1.Pages, :create
    put  "/pages/:page_id" when id == 1,
                            Handlers.V1.Pages, :update_only_one
    get  "/pages/:page_id", Handlers.V1.Pages, :show

    # Auto-create a full set of routes for resources
    #
    resource :users,        Handlers.V1.User, arg: :user_id
    #
    # Generates:
    #
    # get     "/users",           Handlers.V1.User, :index
    # post    "/users",           Handlers.V1.User, :create
    # get     "/users/:user_id",  Handlers.V1.User, :show
    # put     "/users/:user_id",  Handlers.V1.User, :update
    # patch   "/users/:user_id",  Handlers.V1.User, :patch
    # delete  "/users/:user_id",  Handlers.V1.User, :delete
    #
    # options "/users",           "HEAD,GET,POST"
    # options "/users/:_user_id", "HEAD,GET,PUT,PATCH,DELETE"
  end

  # An updated version of the AP
  version "2" do
    get  "/",               Handlers.V2.Pages,  :index
    post "/pages",          Handlers.V2.Pages,  :create
    get  "/pages/:page_id", Handlers.V2.Pages,  :show
    put  "/pages/:page_id", Handlers.V2.Pages,  :update

    raw :trace, "/trace",   Handlers.V2.Tracer, :trace

    resource :users,        Handlers.V2.User
    resource :groups,       Handlers.V2.Group
  end
end
```

`get/3`, `post/3`, `put/3`, `patch/3`, `delete/3`,
`options/2`, and `any/3` are already built-in as
described. `resource` exists but will need
modifications to create everything as noted.

`raw/4` allows for using custom HTTP methods, allowing
your application to be HTTP spec compliant.

`version/2` will need to be created outright. Will
allow requests to contained endpoints when version
exists in either `Accepts` header or URL (which ever
is defined in app config).

Extra routes will need to be added for `*.json`,
`*.xml`, etc. requests for optionally specifying
desired content type without the use of the
`Accepts` header. These should match
parsing/rendering abilities of your application.

## Configuration

TBD.

## License

HttpRouter is released under the MIT License.

See [LICENSE](license) for details.

[plug]: https://github.com/elixir-lang/plug
[license]: https://github.com/sugar-framework/elixir-http-router/blob/master/LICENSE
