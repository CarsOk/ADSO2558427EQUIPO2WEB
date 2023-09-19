require "test_helper"

class CatalogosControllerTest < ActionDispatch::IntegrationTest
  test "should get idex" do
    get catalogos_idex_url
    assert_response :success
  end

  test "should get show" do
    get catalogos_show_url
    assert_response :success
  end
end
