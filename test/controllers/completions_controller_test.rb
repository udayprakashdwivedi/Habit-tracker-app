require "test_helper"

class CompletionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get completions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get completions_destroy_url
    assert_response :success
  end
end
