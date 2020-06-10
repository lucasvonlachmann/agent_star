require "application_system_test_case"

class ChecklistsTest < ApplicationSystemTestCase
  setup do
    @checklist = checklists(:one)
  end

  test "visiting the index" do
    visit checklists_url
    assert_selector "h1", text: "Checklists"
  end

  test "creating a Checklist" do
    visit checklists_url
    click_on "New Checklist"

    fill_in "Berthed", with: @checklist.berthed
    fill_in "Completed ops", with: @checklist.completed_ops
    fill_in "Draft arrival", with: @checklist.draft_arrival
    fill_in "Draft departure", with: @checklist.draft_departure
    fill_in "Eosp", with: @checklist.eosp
    fill_in "Gangway ready", with: @checklist.gangway_ready
    fill_in "Last line", with: @checklist.last_line
    fill_in "Pob arrival", with: @checklist.pob_arrival
    fill_in "Pob departure", with: @checklist.pob_departure
    fill_in "Scale", with: @checklist.scale_id
    fill_in "Started ops", with: @checklist.started_ops
    fill_in "Terminal requested", with: @checklist.terminal_requested
    fill_in "Tugs arrival", with: @checklist.tugs_arrival
    fill_in "Tugs departure", with: @checklist.tugs_departure
    click_on "Create Checklist"

    assert_text "Checklist was successfully created"
    click_on "Back"
  end

  test "updating a Checklist" do
    visit checklists_url
    click_on "Edit", match: :first

    fill_in "Berthed", with: @checklist.berthed
    fill_in "Completed ops", with: @checklist.completed_ops
    fill_in "Draft arrival", with: @checklist.draft_arrival
    fill_in "Draft departure", with: @checklist.draft_departure
    fill_in "Eosp", with: @checklist.eosp
    fill_in "Gangway ready", with: @checklist.gangway_ready
    fill_in "Last line", with: @checklist.last_line
    fill_in "Pob arrival", with: @checklist.pob_arrival
    fill_in "Pob departure", with: @checklist.pob_departure
    fill_in "Scale", with: @checklist.scale_id
    fill_in "Started ops", with: @checklist.started_ops
    fill_in "Terminal requested", with: @checklist.terminal_requested
    fill_in "Tugs arrival", with: @checklist.tugs_arrival
    fill_in "Tugs departure", with: @checklist.tugs_departure
    click_on "Update Checklist"

    assert_text "Checklist was successfully updated"
    click_on "Back"
  end

  test "destroying a Checklist" do
    visit checklists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checklist was successfully destroyed"
  end
end
