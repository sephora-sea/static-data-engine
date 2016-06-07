class InitializerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializers
    directory 'static_data_engine', 'lib/static_data_engine'
  end
end
