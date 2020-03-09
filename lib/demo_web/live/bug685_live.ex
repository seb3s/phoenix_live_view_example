defmodule DemoWeb.Bug685Live do
  use Phoenix.LiveView


  def mount(params, session, socket) do
    case connected?(socket) do
      true -> connected_mount(params, session, socket)
      false -> {:ok, assign(socket, page: "loading")}
    end
  end

  def connected_mount(_params, %{"page" => "dashboard" = page}, socket) do
    {:ok, assign(socket,
      page: page,
      show_modal: nil
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
  def handle_event("close_modal", params, %{assigns: assigns} = socket) do
    {:noreply, assign(socket, show_modal: nil)}
  end

  def handle_event("show_modal", %{"modal" => modal}, socket) do
    {:noreply, assign(socket, show_modal: modal)}
  end

  def handle_event("view_board", _params, %{assigns: assigns} = socket) do
    {:noreply, assign(socket, page: "board", show_modal: nil)}
  end

  def handle_event("view_dashboard", _params, %{assigns: assigns} = socket) do
    {:noreply, assign(socket, page: "dashboard", show_modal: nil)}
  end

end
