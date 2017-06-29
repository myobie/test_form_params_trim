defmodule TestFormParamsTrim.MapTrimmer do
  def trim(map) when is_map(map) do
    for {k, v} <- map, into: %{} do
      {k, trim(v)}
    end
  end

  def trim(value) when is_binary(value), do: String.trim(value)
  def trim(value), do: value
end
