require "application_system_test_case"

class ConfigsTest < ApplicationSystemTestCase
  setup do
    @config = configs(:one)
  end

  test "visiting the index" do
    visit configs_url
    assert_selector "h1", text: "Configs"
  end

  test "should create config" do
    visit configs_url
    click_on "New config"

    fill_in "Parameter", with: @config.parameter
    click_on "Create Config"

    assert_text "Config was successfully created"
    click_on "Back"
  end

  test "should update Config" do
    visit config_url(@config)
    click_on "Edit this config", match: :first

    fill_in "Parameter", with: @config.parameter
    click_on "Update Config"

    assert_text "Config was successfully updated"
    click_on "Back"
  end

  test "should destroy Config" do
    visit config_url(@config)
    click_on "Destroy this config", match: :first

    assert_text "Config was successfully destroyed"
  end
end
