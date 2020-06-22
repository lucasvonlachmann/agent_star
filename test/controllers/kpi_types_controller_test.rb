require 'test_helper'

class KpiTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kpi_type = kpi_types(:one)
  end

  test "should get index" do
    get kpi_types_url
    assert_response :success
  end

  test "should get new" do
    get new_kpi_type_url
    assert_response :success
  end

  test "should create kpi_type" do
    assert_difference('KpiType.count') do
      post kpi_types_url, params: { kpi_type: { name: @kpi_type.name } }
    end

    assert_redirected_to kpi_type_url(KpiType.last)
  end

  test "should show kpi_type" do
    get kpi_type_url(@kpi_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_kpi_type_url(@kpi_type)
    assert_response :success
  end

  test "should update kpi_type" do
    patch kpi_type_url(@kpi_type), params: { kpi_type: { name: @kpi_type.name } }
    assert_redirected_to kpi_type_url(@kpi_type)
  end

  test "should destroy kpi_type" do
    assert_difference('KpiType.count', -1) do
      delete kpi_type_url(@kpi_type)
    end

    assert_redirected_to kpi_types_url
  end
end
