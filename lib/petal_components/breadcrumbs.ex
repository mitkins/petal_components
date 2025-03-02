defmodule PetalComponents.Breadcrumbs do
  use Phoenix.Component
  alias PetalComponents.Link

  attr(:separator, :string, default: "slash", values: ["slash", "chevron"])
  attr(:class, :string, default: "", doc: "Parent div CSS class")
  attr(:link_class, :string, default: "", doc: "Link class CSS")
  attr(:links, :list, default: [], doc: "List of your links")
  attr(:rest, :global)

  # Example:
  # <.breadcrumbs separator="chevron"
  #   class="mt-3"
  #   link_class="!text-blue-500 text-sm font-semibold"
  #   links={[
  #     %{ label: "Link 1", to: "/" },
  #     %{ label: "Link 1", to: "/", link_type: "patch|a|redirect" }
  #   ]}
  # />
  def breadcrumbs(assigns) do
    ~H"""
    <div {@rest} class={"#{@class} flex items-center"}>
      <%= for {link, counter} <- Enum.with_index(@links) do %>
        <%= if counter > 0 do %>
          <.separator type={@separator} />
        <% end %>

        <Link.a
          link_type={link[:link_type] || "a"}
          to={link.to}
          class={get_breadcrumb_classes(@link_class)}
        >
          <%= link.label %>
        </Link.a>
      <% end %>
    </div>
    """
  end

  defp separator(%{type: "slash"} = assigns) do
    ~H"""
    <div class="px-5 text-lg text-gray-300">/</div>
    """
  end

  defp separator(%{type: "chevron"} = assigns) do
    ~H"""
    <div class="px-3 text-gray-300">
      <Heroicons.chevron_right solid class="w-6 h-6" />
    </div>
    """
  end

  defp get_breadcrumb_classes(user_classes),
    do: "hover:underline flex text-gray-500 dark:text-gray-400 #{user_classes}"
end
