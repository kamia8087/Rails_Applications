Rails.application.routes.draw do
  root "sessions#new"
  get 'questions/new_question' => 'questions#new_question', :as => :new_question
  get '/upvote' => 'questions#upvote', :as => :upvote
  get '/downvote' => 'questions#downvote', :as => :downvote
  get 'answers/new' => 'answers#new'
  get '/home' => 'users#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :questions, only: [:create, :destroy]
  resources :answers
end
