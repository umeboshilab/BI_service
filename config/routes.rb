Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  # get 'service/index'
  root 'service#index'
  get 'top/index'
  post 'users/create'
  # put  'users/:id' => 'users/update'
  get 'service' => 'service#index'
  get  'users' =>   'users#show'
  post  'users' =>  'users#signin'
  post  'tasks' =>  'tasks#create'
  delete '/tasks/:id' => 'tasks#destroy'
  get  '/tasks/list' =>   'tasks#show'
  patch  '/tasks/:id' =>   'tasks#update', as: 'task'
  get '/requests/new' =>   'requests#new' 
  post '/requests' =>   'requests#create'
  get '/tasks/rejected' => 'tasks#index_rejected'
  get '/tasks/done' => 'tasks#index_done'
  # post '/requests/:id' =>   'requests#checkRequest'
  # put  '/requests/:id' =>   'requests#report'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# /app/app/views/layouts/application.html.erb