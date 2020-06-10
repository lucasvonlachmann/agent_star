require "application_system_test_case"

class RootCausesTest < ApplicationSystemTestCase
  setup do
    @root_cause = root_causes(:one)
  end

  test "visiting the index" do
    visit root_causes_url
    assert_selector "h1", text: "Root Causes"
  end

  test "creating a Root cause" do
    visit root_causes_url
    click_on "New Root Cause"

    fill_in "Description", with: @root_cause.description
    fill_in "Kpi", with: @root_cause.kpi_id
    fill_in "Name", with: @root_cause.name
    click_on "Create Root cause"

    assert_text "Root cause was successfully created"
    click_on "Back"
  end

  test "updating a Root cause" do
    visit root_causes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @root_cause.description
    fill_in "Kpi", with: @root_cause.kpi_id
    fill_in "Name", with: @root_cause.name
    click_on "Update Root cause"

    assert_text "Root cause was successfully updated"
    click_on "Back"
  end

  test "destroying a Root cause" do
    visit root_causes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Root cause was successfully destroyed"
  end
end
