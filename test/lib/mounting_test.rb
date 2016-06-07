require 'test_helper'

class StaticDataEngineTest < ActiveSupport::TestCase
  test 'integration' do
    assert ::Mounter.mounted?
  end
end
