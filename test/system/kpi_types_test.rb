require "application_system_test_case"

class KpiTypesTest < ApplicationSystemTestCase
  setup do
    @kpi_type = kpi_types(:one)
  end

  test "visiting the index" do
    visit kpi_types_url
    assert_selector "h1", text: "Kpi Types"
  end

  test "creating a Kpi type" do
    visit kpi_types_url
    click_on "New Kpi Type"

    fill_in "Name", with: @kpi_type.name
    click_on "Create Kpi type"

    assert_text "Kpi type was successfully created"
    click_on "Back"
  end

  test "updating a Kpi type" do
    visit kpi_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @kpi_type.name
    click_on "Update Kpi type"

    assert_text "Kpi type was successfully updated"
    click_on "Back"
  end

  test "destroying a Kpi type" do
    visit kpi_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kpi type was successfully destroyed"
  end
end
