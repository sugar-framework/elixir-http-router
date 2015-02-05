defmodule HttpRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test
  use HttpRouter

  test "get/3" do
    conn = conn(:get, "/2/get")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "post/3" do
    conn = conn(:post, "/2/post")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "put/3" do
    conn = conn(:put, "/2/put")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "patch/3" do
    conn = conn(:patch, "/2/patch")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "delete/3" do
    conn = conn(:delete, "/2/delete")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "options/3" do
    conn = conn(:options, "/2/options")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "any/3 any" do
    conn = conn(:any, "/2/any")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "any/3 get" do
    conn = conn(:get, "/2/any")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "raw/4 trace" do
    conn = conn(:trace, "/2/trace")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "resource/2" do
    assert true === true
  end

  test "resource/2 index" do
    conn = conn(:get, "/2/users")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "resource/2 create" do
    conn = conn(:post, "/2/users")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "resource/2 show" do
    conn = conn(:get, "/2/users/1")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "resource/2 update" do
    conn = conn(:put, "/2/users/1")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "resource/2 patch" do
    conn = conn(:patch, "/2/users/1")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "resource/2 delete" do
    conn = conn(:delete, "/2/users/1")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  test "filter plug is run" do
    conn = conn(:get, "/2/get")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
    assert get_resp_header(conn, "content-type") === ["application/json; charset=utf-8"]
  end

  test "resource/2 index with prepended path" do
    conn = conn(:get, "/2/users/2/comments")
      |> HttpRouterTest.Router.call([])

    assert conn.state === :sent
    assert conn.status === 200
  end

  # test "get/3 with translate ext to accepts header" do
  #   conn = conn(:get, "/2/get.json")
  #     |> HttpRouterTest.Router.call([])

  #   assert conn.state === :sent
  #   assert conn.status === 200
  #   assert get_req_header(conn, "accept") === ["application/json"]
  # end

  defmodule Foo do
    def init(opts), do: opts
    def call(conn, opts) do
      apply __MODULE__, opts[:action], [conn, conn.params]
    end
    def get(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def post(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def put(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def patch(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def delete(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def options(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def any(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def trace(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
  end

  defmodule Bar do
    def init(opts), do: opts
    def call(conn, opts) do
      apply __MODULE__, opts[:action], [conn, conn.params]
    end
    def index(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def create(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def show(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def update(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def patch(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
    def delete(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
  end

  defmodule Baz do
    def init(opts), do: opts
    def call(conn, opts) do
      apply __MODULE__, opts[:action], [conn, conn.params]
    end
    def index(conn, _args) do
      conn
        |> Map.put(:resp_body, "")
        |> Map.put(:status, 200)
        |> Map.put(:state, :set)
        |> Plug.Conn.send_resp
    end
  end

  defmodule Router do
    use HttpRouter

    plug :set_utf8_json

    version "1" do
      get "/get", Foo, :get
    end

    version "2" do
      get         "/get",     Foo, :get
      get         "/get/:id", Foo, :get
      post        "/post",    Foo, :post
      put         "/put",     Foo, :put
      patch       "/patch",   Foo, :patch
      delete      "/delete",  Foo, :delete
      options     "/options", "HEAD,GET"
      any         "/any",     Foo, :any
      raw :trace, "/trace",   Foo, :trace

      resource :users,    Bar
      resource :comments, Baz, prepend_path: "/users/:user_id",
                               only: [:index]
    end

    def set_utf8_json(%Plug.Conn{state: state} = conn, _) when state in [:unset, :set] do
      conn |> put_resp_header("content-type", "application/json; charset=utf-8")
    end
    def set_utf8_json(conn, _), do: conn
  end
end
