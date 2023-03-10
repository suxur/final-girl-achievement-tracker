require "application_system_test_case"

class FinalGirlsTest < ApplicationSystemTestCase
  setup do
    @final_girl = final_girls(:one)
  end

  test "visiting the index" do
    visit final_girls_url
    assert_selector "h1", text: "Final girls"
  end

  test "should create final girl" do
    visit final_girls_url
    click_on "New final girl"

    fill_in "Name", with: @final_girl.name
    click_on "Create Final girl"

    assert_text "Final girl was successfully created"
    click_on "Back"
  end

  test "should update Final girl" do
    visit final_girl_url(@final_girl)
    click_on "Edit this final girl", match: :first

    fill_in "Name", with: @final_girl.name
    click_on "Update Final girl"

    assert_text "Final girl was successfully updated"
    click_on "Back"
  end

  test "should destroy Final girl" do
    visit final_girl_url(@final_girl)
    click_on "Destroy this final girl", match: :first

    assert_text "Final girl was successfully destroyed"
  end
end
