defmodule HelloWeb.TestLogin do
  # In Phoenix v1.6+ apps, the line below should be: use MyAppWeb, :live_view
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    Current temperature: <%= @temperature %>
    <button phx-click="inc_temperature">+</button>
    """
  end

  @spec mount(any, map, map) :: {:ok, map}
  def mount(_params, _, socket) do
    temperature = 11
    {:ok, assign(socket, :temperature, temperature)}
  end
  def handle_event("inc_temperature", _value, socket) do
    new_temp = socket.assigns.temperature + 1
    {:noreply, assign(socket, :temperature, new_temp)}
  end

end
