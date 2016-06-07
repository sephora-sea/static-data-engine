require 'test_helper'

class StaticDataEngineTest < ActiveSupport::TestCase
  test 'namespace' do
    assert_equal 'static_data_engine_test', StaticDataEngine::DataSeeder::Base.new.namespace
  end

  test 'create_indexes' do
    StaticDataEngine::DataSeeder::Base.new.create_indexes
  end
end
