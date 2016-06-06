require 'api_constraints'

MakersApi::Application.routes.draw do
  # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do

      resources :groups, :only => [:show, :create, :update, :destroy]
    end
  end
end
