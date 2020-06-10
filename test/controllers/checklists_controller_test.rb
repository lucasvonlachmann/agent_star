require 'test_helper'

class ChecklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checklist = checklists(:one)
  end

  test "should get index" do
    get checklists_url
    assert_response :success
  end

  test "should get new" do
    get new_checklist_url
    assert_response :success
  end

  test "should create checklist" do
    assert_difference('Checklist.count') do
      post checklists_url, params: { checklist: { berthed: @checklist.berthed, completed_ops: @checklist.completed_ops, draft_arrival: @checklist.draft_arrival, draft_departure: @checklist.draft_departure, eosp: @checklist.eosp, gangway_ready: @checklist.gangway_ready, last_line: @checklist.last_line, pob_arrival: @checklist.pob_arrival, pob_departure: @checklist.pob_departure, scale_id: @checklist.scale_id, started_ops: @checklist.started_ops, terminal_requested: @checklist.terminal_requested, tugs_arrival: @checklist.tugs_arrival, tugs_departure: @checklist.tugs_departure } }
    end

    assert_redirected_to checklist_url(Checklist.last)
  end

  test "should show checklist" do
    get checklist_url(@checklist)
    assert_response :success
  end

  test "should get edit" do
    get edit_checklist_url(@checklist)
    assert_response :success
  end

  test "should update checklist" do
    patch checklist_url(@checklist), params: { checklist: { berthed: @checklist.berthed, completed_ops: @checklist.completed_ops, draft_arrival: @checklist.draft_arrival, draft_departure: @checklist.draft_departure, eosp: @checklist.eosp, gangway_ready: @checklist.gangway_ready, last_line: @checklist.last_line, pob_arrival: @checklist.pob_arrival, pob_departure: @checklist.pob_departure, scale_id: @checklist.scale_id, started_ops: @checklist.started_ops, terminal_requested: @checklist.terminal_requested, tugs_arrival: @checklist.tugs_arrival, tugs_departure: @checklist.tugs_departure } }
    assert_redirected_to checklist_url(@checklist)
  end

  test "should destroy checklist" do
    assert_difference('Checklist.count', -1) do
      delete checklist_url(@checklist)
    end

    assert_redirected_to checklists_url
  end
end
