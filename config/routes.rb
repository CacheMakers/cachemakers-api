require 'api_constraints'

MakersApi::Application.routes.draw do
  scope module: 'api/v1',
    constraints: ApiConstraints.new(version: 1, default: true),
    defaults: { format: :json } do

      resources :groups, :only => [:show]
      resources :users, :only => [:show, :create, :update, :destroy] do
        resources :groups, :only => [:create, :update, :destroy]
      end
      resources :sessions, :only => [:create, :destroy]

      devise_for :users
    end
  end
