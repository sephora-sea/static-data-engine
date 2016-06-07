require 'test_helper'
require 'generators/initializer/initializer_generator'

module StaticDataEngine
  class InitializerGeneratorTest < Rails::Generators::TestCase
    tests InitializerGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    test 'copies respective directories to appropriate places' do
      run_generator
      assert_file Rails.root.join('tmp/generators/lib/static_data_engine/data_sources/example.yml')
    end
  end
end
