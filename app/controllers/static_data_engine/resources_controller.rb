require_dependency 'static_data_engine/application_controller'

class StaticDataEngine::ResourcesController < ApplicationController
  def search
    unless params[:table] && params[:query] && params[:field]
      render json: {success: false, message: 'Missing parameters. Required `table`, `query` and `field`.'}, status: :unprocessable_entity
      return
    end

    begin
      result = StaticDataEngine::Query::Basic.new.search(
        params[:table],
        params[:field],
        params[:query]
      )

      render json: {success: true, results: result}
    rescue Elasticsearch::Transport::Transport::Errors::NotFound
      render json: {success: false, message: 'Index not found.'}, status: :unprocessable_entity
    end
  end
end
