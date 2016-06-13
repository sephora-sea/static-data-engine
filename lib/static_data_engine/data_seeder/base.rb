require 'elasticsearch'
require 'yaml'

module StaticDataEngine::DataSeeder
  class Base
    include StaticDataEngine::Namespace
    include StaticDataEngine::Client

    def build_indexes!
      Dir[Rails.root.join('lib/static_data_engine/data_sources/*.yml')].each do |dir_path|
        source = YAML.load_file(dir_path)
        persist_index source
      end
    end

    private

    def persist_index(data)
      index = namespaced_index(data['dataset_name'])

      field_types = data['attributes'].inject({}) do |hash, (attribute, attribute_type)|
        hash[attribute] = attribute_type
        hash
      end

      clear_existing_index(index)

      data['data'].each_slice(100) do |batch|
        body_content = []

        batch.each do |tuple|
          tuple.each do |k, v|
            tuple[k] = cast_to_field_type(v, field_types[k])
          end

          body_content << {index: {_index: index, _type: 'default'}}
          body_content << tuple
        end

        client.bulk body: body_content
      end

      client.indices.refresh(index: index)
    end

    def clear_existing_index(index)
      begin
        client.indices.delete index: index
      rescue Elasticsearch::Transport::Transport::Errors::NotFound
      end
    end

    def cast_to_field_type(field, type)
      case type.to_s
        when 'string'
          field.to_s
        when 'integer'
          field.to_i
      end
    end
  end
end
