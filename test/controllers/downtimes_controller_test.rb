require 'test_helper'

class DowntimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @downtime = downtimes(:one)
  end

  test "should get index" do
    get downtimes_url
    assert_response :success
  end

  test "should get new" do
    get new_downtime_url
    assert_response :success
  end

  test "should create downtime" do
    assert_difference('Downtime.count') do
      post downtimes_url, params: { downtime: { area: @downtime.area, comment: @downtime.comment, date: @downtime.date, downtime: @downtime.downtime, equipment: @downtime.equipment, line: @downtime.line, reason_code: @downtime.reason_code, shift: @downtime.shift, start_time: @downtime.start_time, stop_time: @downtime.stop_time } }
    end

    assert_redirected_to downtime_url(Downtime.last)
  end

  test "should show downtime" do
    get downtime_url(@downtime)
    assert_response :success
  end

  test "should get edit" do
    get edit_downtime_url(@downtime)
    assert_response :success
  end

  test "should update downtime" do
    patch downtime_url(@downtime), params: { downtime: { area: @downtime.area, comment: @downtime.comment, date: @downtime.date, downtime: @downtime.downtime, equipment: @downtime.equipment, line: @downtime.line, reason_code: @downtime.reason_code, shift: @downtime.shift, start_time: @downtime.start_time, stop_time: @downtime.stop_time } }
    assert_redirected_to downtime_url(@downtime)
  end

  test "should destroy downtime" do
    assert_difference('Downtime.count', -1) do
      delete downtime_url(@downtime)
    end

    assert_redirected_to downtimes_url
  end
end
