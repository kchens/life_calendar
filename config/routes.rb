require 'api_constraints'

LifeCalendarApi::Application.routes.draw do

  devise_for :users
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:index, :show, :create, :update, :destroy]
      resources :sessions, :only => [:index, :create, :destroy]
    end
  end
end
