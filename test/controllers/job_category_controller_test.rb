require "test_helper"

class JobCategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_category_index_url
    assert_response :success
  end
end
