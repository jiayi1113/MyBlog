Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :blogs do
    resources :articles, shallow: true do 
      member do 
        get :state
      end
    end
    resources :blog_roles, only: [:index, :new, :create]
  end

  resources :blog_roles, only: [:destroy]
end
