require 'test_helper'

class StrategyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get strategy_index_url
    assert_response :success
  end

  test "should get calculate" do
    get strategy_calculate_url
    assert_response :success
  end

end
