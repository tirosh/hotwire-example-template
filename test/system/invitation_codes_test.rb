require "application_system_test_case"

class InvitationCodesTest < ApplicationSystemTestCase
  test "copy code to clipboard" do
    code = "secret"

    visit invitation_code_path(id: code)
    click_on("Copy to clipboard").then { assert_selector :alert, "Copied to clipboard" }
    find(:field, "Paste").click
    send_keys :meta, "v"

    assert_field "Paste", with: code
  end
end
