module StaticDataEngine::DataSeeders
  class Base
    def create_indexes
      detect_indexes
      # create_each
    end

    def indexes
      @indexes ||= Rails.application.config.static_data_engine_indexes
    end
  end
end
