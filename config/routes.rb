Rails.application.routes.draw do
    resources :items, only: %i(index show) do
        collection do
            get :recommended
            get :uncategorized
        end
    end
    
    root 'portal#show'
    
    resources :categories, only: %i(show index) do
        resources :items, only: %i(index)
    end 
    
    resources :line_items, only: %i(create) 
    resources :orders
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    # Serve websocket cable requests in-process
    # mount ActionCable.server => '/cable'
end
