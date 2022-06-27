Rails.application.routes.draw do
root to: "homes#top"
 get 'home/about' => 'homes#about', as: "about"
 devise_for :users
 resources :users
 resources :books
 resources :users, only: [:show, :edit]
 
 end