defmodule DemoWeb.ColumnComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    Phoenix.View.render(DemoWeb.PageView, "component_column.html", assigns)
  end

end