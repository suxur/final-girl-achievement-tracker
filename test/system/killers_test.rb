require "application_system_test_case"

class KillersTest < ApplicationSystemTestCase
  setup do
    @killer = killers(:one)
  end

  test "visiting the index" do
    visit killers_url
    assert_selector "h1", text: "Killers"
  end

  test "should create killer" do
    visit killers_url
    click_on "New killer"

    fill_in "Name", with: @killer.name
    click_on "Create Killer"

    assert_text "Killer was successfully created"
    click_on "Back"
  end

  test "should update Killer" do
    visit killer_url(@killer)
    click_on "Edit this killer", match: :first

    fill_in "Name", with: @killer.name
    click_on "Update Killer"

    assert_text "Killer was successfully updated"
    click_on "Back"
  end

  test "should destroy Killer" do
    visit killer_url(@killer)
    click_on "Destroy this killer", match: :first

    assert_text "Killer was successfully destroyed"
  end
end
