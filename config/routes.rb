require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users
  # namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/' do
  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :courses do
        resources :topics
      end
      resources :user_courses
    end
  end
end
