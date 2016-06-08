require 'test_helper'

class StaticDataEngine::Query::BasicTest < ActiveSupport::TestCase
  include TestData

  test '#search' do
    seed_data!

    result = StaticDataEngine::Query::Basic.new.search('test_basic', 'attrib1:foo')
    assert_equal 1, result.count

    result = StaticDataEngine::Query::Basic.new.search('test_basic', nil, body: {
      query: {
        match: {
          attrib1: 'foo'
        }
      }
    })

    assert_equal 1, result.count
    assert_equal 'foo', result.first['attrib1']
  end
end
