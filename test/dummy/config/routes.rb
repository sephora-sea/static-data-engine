Rails.application.routes.draw do

  mount StaticDataEngine::Engine => "/static_data_engine"
end
