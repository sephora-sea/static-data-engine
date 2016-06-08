StaticDataEngine::Engine.routes.draw do
  resources :resources, only: %i() do
    collection do
      get :search
    end
  end
end
