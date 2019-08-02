defmodule PocRecaptchaWeb.PageController do
  use PocRecaptchaWeb, :controller

  # def recaptcha_site_key(), do: Application.fetch_env!(:poc_recaptcha, :recaptcha_site_key)
  # def recaptcha_secret(), do: Application.fetch_env!(:poc_recaptcha, :recaptcha_secret)

  # def recaptcha_config(),
  #   do: %{recaptcha_site_key: recaptcha_site_key(), recaptcha_secret: recaptcha_secret()}

  def index(conn, _params) do
    render(conn, "index.html", %{config: nil, response: "", error: ""})
  end


  def create(conn, params) do
    case Recaptcha.verify(params["g-recaptcha-response"]) do
      {:ok, _response} -> render(conn, "index.html", %{config: nil, response: "", error: ""})
      {:error, _errors} -> render(conn, "index.html", %{config: nil, response: "", error: ""})
    end
  end

  # def recaptcha(conn, params) do
  #   assigns =
  #     case parse_recaptcha_token(params["recaptcha_token"]) do
  #       {:ok, response} ->
  #         %{response: "#{inspect(response)}", error: ""}

  #       error ->
  #         %{response: "", error: "#{inspect(error)}"}
  #     end

  #   render(conn, "index.html", assigns |> Map.put(:config, recaptcha_config()))
  # end

  # @headers [
  #   {"Content-type", "application/x-www-form-urlencoded"},
  #   {"Accept", "application/json"}
  # ]

  # @verify_url "https://www.google.com/recaptcha/api/siteverify"

  # defp parse_recaptcha_token(nil), do: {:error, :recaptcha_token_not_found}

  # defp parse_recaptcha_token(token) do
  #   body =
  #     %{secret: "6Ldiq2AUAAAAAPwhWIVXcQ67rOOQokQ8gYbzqzFI", response: token} |> URI.encode_query()

  #   case HTTPoison.post(@verify_url, body, @headers) do
  #     {:ok, response} ->
  #       body = response.body |> Poison.decode!()

  #       if body["success"] do
  #         {:ok, body}
  #       else
  #         {:error, body}
  #       end

  #     _ ->
  #       {:error, :verify_error}
  #   end
  # end
end
