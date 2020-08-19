require "application_system_test_case"

class DowntimesTest < ApplicationSystemTestCase
  setup do
    @downtime = downtimes(:one)
  end

  test "visiting the index" do
    visit downtimes_url
    assert_selector "h1", text: "Downtimes"
  end

  test "creating a Downtime" do
    visit downtimes_url
    click_on "New Downtime"

    fill_in "Area", with: @downtime.area
    fill_in "Comment", with: @downtime.comment
    fill_in "Date", with: @downtime.date
    fill_in "Downtime", with: @downtime.downtime
    fill_in "Equipment", with: @downtime.equipment
    fill_in "Line", with: @downtime.line
    fill_in "Reason code", with: @downtime.reason_code
    fill_in "Shift", with: @downtime.shift
    fill_in "Start time", with: @downtime.start_time
    fill_in "Stop time", with: @downtime.stop_time
    click_on "Create Downtime"

    assert_text "Downtime was successfully created"
    click_on "Back"
  end

  test "updating a Downtime" do
    visit downtimes_url
    click_on "Edit", match: :first

    fill_in "Area", with: @downtime.area
    fill_in "Comment", with: @downtime.comment
    fill_in "Date", with: @downtime.date
    fill_in "Downtime", with: @downtime.downtime
    fill_in "Equipment", with: @downtime.equipment
    fill_in "Line", with: @downtime.line
    fill_in "Reason code", with: @downtime.reason_code
    fill_in "Shift", with: @downtime.shift
    fill_in "Start time", with: @downtime.start_time
    fill_in "Stop time", with: @downtime.stop_time
    click_on "Update Downtime"

    assert_text "Downtime was successfully updated"
    click_on "Back"
  end

  test "destroying a Downtime" do
    visit downtimes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Downtime was successfully destroyed"
  end
end
