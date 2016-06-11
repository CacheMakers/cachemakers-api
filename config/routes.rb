require 'api_constraints'

MakersApi::Application.routes.draw do
  # devise_for :users
  # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do



      resources :groups, :only => [:show]
      resources :users, :only => [:show, :create, :update, :destroy] do
        resources :groups, :only => [:create, :update, :destroy]
      end
      resources :sessions, :only => [:create, :destroy]

      devise_for :users
    end
  end
end
