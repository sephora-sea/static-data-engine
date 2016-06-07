require 'elasticsearch'
require 'yaml'

module StaticDataEngine::DataSeeder
  class Base
    def create_indexes
      Dir[Rails.root.join('lib/static_data_engine/data_sources/*.yml')].each do |dir_path|
        source = YAML.load_file(dir_path)
        persist_index source
      end
    end

    private

    def persist_index(data)
      index = "#{namespace}_#{data['dataset_name']}"

      field_types = data['attributes'].inject({}) do |hash, (attribute, attribute_type)|
        hash[attribute] = attribute_type
        hash
      end

      data['data'].each do |tuple|
        tuple.each do |k, v|
          tuple[k] = cast_to_field_type(v, field_types[tuple[k]])
        end

        client.index index: index, body: tuple
      end
    end

    def cast_to_field_type(field, type)
      case type
        when 'string'
          field.to_s
        when 'integer'
          field.to_i
      end
    end

    def client
      @client ||= Elasticsearch::Client.new
    end

    def namespace
      @ns ||=
        "#{Rails.configuration.x.static_data_engine.namespace || 'static_data_engine'}_#{Rails.env}"
    end
  end
end
