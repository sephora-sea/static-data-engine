module StaticDataEngine::Query
  class Basic
    include StaticDataEngine::Namespace
    include StaticDataEngine::Client

    def search(index, field, query, opts = {})
      index = namespaced_index(index)

      results = if opts[:body]
                  client.search(index: index, body: opts[:body])
                else
                  client.search(index: index, q: "#{field}:#{query}")
                end

      parse_results results
    end

    private

    def parse_results(results)
      if results['hits']['total'] == 0
        []
      else
        results['hits']['hits'].map do |hit|
          {
            id: hit['_id']
          }.merge(hit['_source'])
        end
      end
    end
  end
end
