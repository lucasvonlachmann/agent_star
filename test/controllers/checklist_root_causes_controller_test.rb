require 'test_helper'

class ChecklistRootCausesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checklist_root_cause = checklist_root_causes(:one)
  end

  test "should get index" do
    get checklist_root_causes_url
    assert_response :success
  end

  test "should get new" do
    get new_checklist_root_cause_url
    assert_response :success
  end

  test "should create checklist_root_cause" do
    assert_difference('ChecklistRootCause.count') do
      post checklist_root_causes_url, params: { checklist_root_cause: { checklist_id: @checklist_root_cause.checklist_id, root_cause_id: @checklist_root_cause.root_cause_id } }
    end

    assert_redirected_to checklist_root_cause_url(ChecklistRootCause.last)
  end

  test "should show checklist_root_cause" do
    get checklist_root_cause_url(@checklist_root_cause)
    assert_response :success
  end

  test "should get edit" do
    get edit_checklist_root_cause_url(@checklist_root_cause)
    assert_response :success
  end

  test "should update checklist_root_cause" do
    patch checklist_root_cause_url(@checklist_root_cause), params: { checklist_root_cause: { checklist_id: @checklist_root_cause.checklist_id, root_cause_id: @checklist_root_cause.root_cause_id } }
    assert_redirected_to checklist_root_cause_url(@checklist_root_cause)
  end

  test "should destroy checklist_root_cause" do
    assert_difference('ChecklistRootCause.count', -1) do
      delete checklist_root_cause_url(@checklist_root_cause)
    end

    assert_redirected_to checklist_root_causes_url
  end
end
