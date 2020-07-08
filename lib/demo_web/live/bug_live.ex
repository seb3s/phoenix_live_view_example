defmodule DemoWeb.BugLive do
  use Phoenix.LiveView


  def mount(params, session, socket) do
    case connected?(socket) do
      true -> connected_mount(params, session, socket)
      false -> {:ok, assign(socket, page: "loading")}
    end
  end

  def connected_mount(_params, %{"page" => "dashboard" = page}, socket) do
    {:ok, assign(socket,
      page: page
    )}

  end

  def connected_mount(_params, _session, socket) do
    {:ok, assign(socket, page: "error")}
  end


  def render(%{page: "loading"} = assigns) do
    ~L"<div>La page est en cours de chargement, veuillez patienter...</div>"
  end

  def render(%{page: "error"} = assigns) do
    ~L"<div>Une erreur s'est produite</div>"
  end

  def render(%{page: page} = assigns) do
    Phoenix.View.render(DemoWeb.PageView, "page_" <> page <> ".html", assigns)
  end


  ## handle_event
  ## ------------
  def handle_event("view_board", _params, %{assigns: assigns} = socket) do
    columns = [
      %{:id => "1", :descr => "column 1"},
      %{:id => "2", :descr => "column 2"},
      %{:id => "3", :descr => "column 3"},
      %{:id => "4", :descr => "column 4"},
      %{:id => "5", :descr => "column 5"},
      %{:id => "6", :descr => "column 6"},
      %{:id => "7", :descr => "column 7"},
      %{:id => "8", :descr => "column 8"}
    ]
    {:noreply, assign(socket, page: "board", columns: columns)}
  end

  def handle_event("view_dashboard", _params, %{assigns: assigns} = socket) do
    {:noreply, assign(socket, page: "dashboard")}
  end

end
