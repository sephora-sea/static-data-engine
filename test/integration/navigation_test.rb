require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  setup do
    @routes = StaticDataEngine::Engine.routes
  end

  test 'route to resources#search' do
    assert_routing '/resources/search', controller: 'static_data_engine/resources', action: 'search'
  end
end

