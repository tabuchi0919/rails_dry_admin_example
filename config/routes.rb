# frozen_string_literal: true

Rails.application.routes.draw do
  root 'root#show'
  resources :users, only: %i[index]
end
