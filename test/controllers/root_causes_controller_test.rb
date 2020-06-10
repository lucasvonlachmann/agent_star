require 'test_helper'

class RootCausesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @root_cause = root_causes(:one)
  end

  test "should get index" do
    get root_causes_url
    assert_response :success
  end

  test "should get new" do
    get new_root_cause_url
    assert_response :success
  end

  test "should create root_cause" do
    assert_difference('RootCause.count') do
      post root_causes_url, params: { root_cause: { description: @root_cause.description, kpi_id: @root_cause.kpi_id, name: @root_cause.name } }
    end

    assert_redirected_to root_cause_url(RootCause.last)
  end

  test "should show root_cause" do
    get root_cause_url(@root_cause)
    assert_response :success
  end

  test "should get edit" do
    get edit_root_cause_url(@root_cause)
    assert_response :success
  end

  test "should update root_cause" do
    patch root_cause_url(@root_cause), params: { root_cause: { description: @root_cause.description, kpi_id: @root_cause.kpi_id, name: @root_cause.name } }
    assert_redirected_to root_cause_url(@root_cause)
  end

  test "should destroy root_cause" do
    assert_difference('RootCause.count', -1) do
      delete root_cause_url(@root_cause)
    end

    assert_redirected_to root_causes_url
  end
end
