module StaticDataEngine::Client
  def client
    @client ||= Elasticsearch::Client.new
  end
end
