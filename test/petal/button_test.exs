defmodule PetalComponents.ButtonTest do
  use ComponentCase
  import PetalComponents.Button

  test "button" do
    assigns = %{}
    html = rendered_to_string(
      ~H"""
      <.button label="Press me" phx-click="click_event" />
      """
    )

    assert html =~ "Press me"
  end

  test "a" do
    assigns = %{}
    html = rendered_to_string(
      ~H"""
      <.a label="Press me" href="/" phx-click="Press me" />
      """
    )
    assert html =~ "Press me"
    assert html =~ "<a"
    assert html =~ "href"
    assert html =~ "phx-click"
  end

  test "patch" do
    assigns = %{}
    html = rendered_to_string(
      ~H"""
      <.patch label="Press me" href="/" phx-click="click_event" />
      """
    )
    assert html =~ "Press me"
    assert html =~ "<a"
    assert html =~ "href"
    assert html =~ "phx-click"
  end

  test "redirect" do
    assigns = %{}
    html = rendered_to_string(
      ~H"""
      <.redirect label="Press me" href="/" phx-click="click_event" />
      """
    )
    assert html =~ "Press me"
    assert html =~ "<a"
    assert html =~ "href"
    assert html =~ "phx-click"
  end

  test "button with inner_block" do
    assigns = %{}
    html = rendered_to_string(
      ~H"""
      <.button phx-click="click_event">Press me</.button>
      """
    )
    assert html =~ "<button"
    assert html =~ "Press me"
  end
end
