require "application_system_test_case"

class KpisTest < ApplicationSystemTestCase
  setup do
    @kpi = kpis(:one)
  end

  test "visiting the index" do
    visit kpis_url
    assert_selector "h1", text: "Kpis"
  end

  test "creating a Kpi" do
    visit kpis_url
    click_on "New Kpi"

    fill_in "Carrier", with: @kpi.carrier_id
    fill_in "Max limit", with: @kpi.max_limit
    fill_in "Min limit", with: @kpi.min_limit
    fill_in "Name", with: @kpi.name
    fill_in "Taget", with: @kpi.taget
    click_on "Create Kpi"

    assert_text "Kpi was successfully created"
    click_on "Back"
  end

  test "updating a Kpi" do
    visit kpis_url
    click_on "Edit", match: :first

    fill_in "Carrier", with: @kpi.carrier_id
    fill_in "Max limit", with: @kpi.max_limit
    fill_in "Min limit", with: @kpi.min_limit
    fill_in "Name", with: @kpi.name
    fill_in "Taget", with: @kpi.taget
    click_on "Update Kpi"

    assert_text "Kpi was successfully updated"
    click_on "Back"
  end

  test "destroying a Kpi" do
    visit kpis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kpi was successfully destroyed"
  end
end
