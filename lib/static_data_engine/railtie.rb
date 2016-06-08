module StaticDataEngine
  class Railtie < Rails::Railtie
    railtie_name :static_data_engine

    generators do
      require_relative '../generators/static_data_engine/initializer/initializer_generator'
    end
  end
end
