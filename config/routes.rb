Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :blogs do
    resources :articles, shallow: true do 
      member do 
        get :state
      end
    end
  end
end
