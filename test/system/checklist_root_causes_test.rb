require "application_system_test_case"

class ChecklistRootCausesTest < ApplicationSystemTestCase
  setup do
    @checklist_root_cause = checklist_root_causes(:one)
  end

  test "visiting the index" do
    visit checklist_root_causes_url
    assert_selector "h1", text: "Checklist Root Causes"
  end

  test "creating a Checklist root cause" do
    visit checklist_root_causes_url
    click_on "New Checklist Root Cause"

    fill_in "Checklist", with: @checklist_root_cause.checklist_id
    fill_in "Root cause", with: @checklist_root_cause.root_cause_id
    click_on "Create Checklist root cause"

    assert_text "Checklist root cause was successfully created"
    click_on "Back"
  end

  test "updating a Checklist root cause" do
    visit checklist_root_causes_url
    click_on "Edit", match: :first

    fill_in "Checklist", with: @checklist_root_cause.checklist_id
    fill_in "Root cause", with: @checklist_root_cause.root_cause_id
    click_on "Update Checklist root cause"

    assert_text "Checklist root cause was successfully updated"
    click_on "Back"
  end

  test "destroying a Checklist root cause" do
    visit checklist_root_causes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checklist root cause was successfully destroyed"
  end
end
