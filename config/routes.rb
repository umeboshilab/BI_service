Rails.application.routes.draw do
  root 'top#index'
  get '/login', to: 'sessions#login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # get 'service/index'
  get 'top/index'
  # put  'users/:id' => 'users/update'
  get 'service' => 'service#index'
  post  'tasks' =>  'tasks#create'
  delete '/tasks/:id' => 'tasks#destroy'
  get  '/tasks/list' =>   'tasks#show'
  patch  '/tasks/:id' =>   'tasks#update', as: 'task'
  get '/requests/new' =>   'requests#new' 
  post '/requests' =>   'requests#create'
  get '/tasks/rejected' => 'tasks#index_rejected'
  get '/tasks/done' => 'tasks#index_done'
  get '/users/join_group' => 'users#join_group'
  # post '/requests/:id' =>   'requests#checkRequest'
  # put  '/requests/:id' =>   'requests#report'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create update]
  resources :groups, only: %i[new create]
end


# /app/app/views/layouts/application.html.erb