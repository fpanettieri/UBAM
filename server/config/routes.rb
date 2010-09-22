UBAM::Application.routes.draw do
  resources :logs do
    collection do
      get  :index
      post :create
    end
  end
end
