module StaticDataEngine::Namespace
  private

  def namespace
    @ns ||=
      "#{Rails.configuration.x.static_data_engine.namespace || 'static_data_engine'}_#{Rails.env}"
  end

  def namespaced_index(index)
    "#{namespace}_#{index}"
  end
end
