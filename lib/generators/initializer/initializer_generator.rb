class InitializerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializers
    directory 'static_data_engine', 'lib/static_data_engine'
    copy_file 'static_data_engine_initializer.rb', 'config/initializers/static_data_engine_initializer.rb'
  end
end
