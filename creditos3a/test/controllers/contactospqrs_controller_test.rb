require "test_helper"

class ContactospqrsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contactospqrs_new_url
    assert_response :success
  end

  test "should get create" do
    get contactospqrs_create_url
    assert_response :success
  end
end
