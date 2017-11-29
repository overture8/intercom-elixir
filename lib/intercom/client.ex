defmodule Intercom.Client do
  use HTTPoison.Base

  defp process_request_headers(headers) do
    headers
    |> Enum.into([Accept: "application/json"])
    |> Enum.into(["Content-Type": "application/json"])
    |> Enum.into([Authorization: "Bearer #{access_token()}"])
  end

  def process_url(url) do
    "https://api.intercom.io" <> url
  end

  defp access_token do
    Application.fetch_env!(:intercom, :access_token)
  end
end
