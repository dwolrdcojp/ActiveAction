require 'test_helper'

class DowntimeCriteriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @downtime_criterium = downtime_criteria(:one)
  end

  test "should get index" do
    get downtime_criteria_url
    assert_response :success
  end

  test "should get new" do
    get new_downtime_criterium_url
    assert_response :success
  end

  test "should create downtime_criterium" do
    assert_difference('DowntimeCriterium.count') do
      post downtime_criteria_url, params: { downtime_criterium: { area: @downtime_criterium.area, downtime_id: @downtime_criterium.downtime_id, equipment: @downtime_criterium.equipment, line: @downtime_criterium.line, reason_code: @downtime_criterium.reason_code, shift: @downtime_criterium.shift } }
    end

    assert_redirected_to downtime_criterium_url(DowntimeCriterium.last)
  end

  test "should show downtime_criterium" do
    get downtime_criterium_url(@downtime_criterium)
    assert_response :success
  end

  test "should get edit" do
    get edit_downtime_criterium_url(@downtime_criterium)
    assert_response :success
  end

  test "should update downtime_criterium" do
    patch downtime_criterium_url(@downtime_criterium), params: { downtime_criterium: { area: @downtime_criterium.area, downtime_id: @downtime_criterium.downtime_id, equipment: @downtime_criterium.equipment, line: @downtime_criterium.line, reason_code: @downtime_criterium.reason_code, shift: @downtime_criterium.shift } }
    assert_redirected_to downtime_criterium_url(@downtime_criterium)
  end

  test "should destroy downtime_criterium" do
    assert_difference('DowntimeCriterium.count', -1) do
      delete downtime_criterium_url(@downtime_criterium)
    end

    assert_redirected_to downtime_criteria_url
  end
end
