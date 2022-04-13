require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get article" do
    get articles_article_url
    assert_response :success
  end
end
