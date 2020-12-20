# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :specialities, except: :show
  resources :doctors
  resource :patient, except: %i[new create show destroy]
end
