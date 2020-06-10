require 'test_helper'

class KpisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kpi = kpis(:one)
  end

  test "should get index" do
    get kpis_url
    assert_response :success
  end

  test "should get new" do
    get new_kpi_url
    assert_response :success
  end

  test "should create kpi" do
    assert_difference('Kpi.count') do
      post kpis_url, params: { kpi: { carrier_id: @kpi.carrier_id, max_limit: @kpi.max_limit, min_limit: @kpi.min_limit, name: @kpi.name, taget: @kpi.taget } }
    end

    assert_redirected_to kpi_url(Kpi.last)
  end

  test "should show kpi" do
    get kpi_url(@kpi)
    assert_response :success
  end

  test "should get edit" do
    get edit_kpi_url(@kpi)
    assert_response :success
  end

  test "should update kpi" do
    patch kpi_url(@kpi), params: { kpi: { carrier_id: @kpi.carrier_id, max_limit: @kpi.max_limit, min_limit: @kpi.min_limit, name: @kpi.name, taget: @kpi.taget } }
    assert_redirected_to kpi_url(@kpi)
  end

  test "should destroy kpi" do
    assert_difference('Kpi.count', -1) do
      delete kpi_url(@kpi)
    end

    assert_redirected_to kpis_url
  end
end
