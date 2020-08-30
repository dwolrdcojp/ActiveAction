require "application_system_test_case"

class DowntimeCriteriaTest < ApplicationSystemTestCase
  setup do
    @downtime_criterium = downtime_criteria(:one)
  end

  test "visiting the index" do
    visit downtime_criteria_url
    assert_selector "h1", text: "Downtime Criteria"
  end

  test "creating a Downtime criterium" do
    visit downtime_criteria_url
    click_on "New Downtime Criterium"

    fill_in "Area", with: @downtime_criterium.area
    fill_in "Downtime", with: @downtime_criterium.downtime_id
    fill_in "Equipment", with: @downtime_criterium.equipment
    fill_in "Line", with: @downtime_criterium.line
    fill_in "Reason code", with: @downtime_criterium.reason_code
    fill_in "Shift", with: @downtime_criterium.shift
    click_on "Create Downtime criterium"

    assert_text "Downtime criterium was successfully created"
    click_on "Back"
  end

  test "updating a Downtime criterium" do
    visit downtime_criteria_url
    click_on "Edit", match: :first

    fill_in "Area", with: @downtime_criterium.area
    fill_in "Downtime", with: @downtime_criterium.downtime_id
    fill_in "Equipment", with: @downtime_criterium.equipment
    fill_in "Line", with: @downtime_criterium.line
    fill_in "Reason code", with: @downtime_criterium.reason_code
    fill_in "Shift", with: @downtime_criterium.shift
    click_on "Update Downtime criterium"

    assert_text "Downtime criterium was successfully updated"
    click_on "Back"
  end

  test "destroying a Downtime criterium" do
    visit downtime_criteria_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Downtime criterium was successfully destroyed"
  end
end
