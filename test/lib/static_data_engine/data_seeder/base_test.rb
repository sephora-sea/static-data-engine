require 'test_helper'

class StaticDataEngine::DataSeeder::BaseTest < ActiveSupport::TestCase
  test '#namespace' do
    assert_equal 'static_data_engine_test', StaticDataEngine::DataSeeder::Base.new.send(:namespace)
  end

  test '#build_indexes!' do
    stub.any_instance_of(StaticDataEngine::DataSeeder::Base).namespace { 'static_data_engine' }
    StaticDataEngine::DataSeeder::Base.new.build_indexes!

    results = Elasticsearch::Client.new.search(index: 'static_data_engine_test_data')
    assert_equal 2, results['hits']['total']

    results = Elasticsearch::Client.new.search(index: 'static_data_engine_test_data', q: 'field1:1')
    assert_equal 1, results['hits']['total']
    tuple = results['hits']['hits'].first['_source']
    assert_equal({'field1' => 1, 'field2' => 'foo'}, tuple)

    results = Elasticsearch::Client.new.search(index: 'static_data_engine_test_data', q: 'field1:2')
    assert_equal 1, results['hits']['total']

    tuple = results['hits']['hits'].first['_source']
    assert_equal({'field1' => 2, 'field2' => 'bar'}, tuple)
  end

  test '#cast_to_field_type' do
    assert_equal 1, StaticDataEngine::DataSeeder::Base.new.send(:cast_to_field_type, '1', 'integer')
    assert_equal '1', StaticDataEngine::DataSeeder::Base.new.send(:cast_to_field_type, 1, 'string')
  end
end
