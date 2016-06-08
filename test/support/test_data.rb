require 'elasticsearch'

module TestData
  def seed_data!
    stub.any_instance_of(StaticDataEngine::Query::Basic).namespace { 'static_data_engine' }
    client = Elasticsearch::Client.new
    clear_existing_index client, 'static_data_engine_test_basic'

    client.index(index: 'static_data_engine_test_basic', type: 'default', body: {attrib1: 'foo', attrib2: 'bar'})
    client.indices.refresh(index: 'static_data_engine_test_basic')
  end

  def clear_existing_index(client, index)
    begin
      client.indices.delete index: index
    rescue Elasticsearch::Transport::Transport::Errors::NotFound
    end
  end
end
