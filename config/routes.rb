Rails.application.routes.draw do
  root 'portal#show'
  resources :items, only: %i(index show) do
    collection do
      get :recommended
    end
  end
  resources :categories, only: %i(index) do
    resources :items, only: %w(index) 
  end

  resources :line_items, only: %i(create)
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
