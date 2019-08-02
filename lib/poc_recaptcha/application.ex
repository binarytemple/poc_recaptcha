defmodule PocRecaptcha.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    Confex.resolve_env!(:recaptcha)

    children = [
      PocRecaptchaWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: PocRecaptcha.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    PocRecaptchaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
