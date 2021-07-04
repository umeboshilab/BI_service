Rails.application.routes.draw do
  # root 'service#index'
  get 'top/index'
  post 'users/create'
  # put  'users/:id' => 'users/update'
  get  'users' =>   'users#show'
  post  'users' =>  'users#signin'
  post  'tasks' =>  'tasks#create'
  # delete '/tasks/:id' => 'tasks#delete'
  get  '/tasks/list' =>   'tasks#show'
  # put  '/tasks/:id' =>   'tasks#update'
  post '/requests' =>   'requests#create'
  # get  '/requests/:id' =>   'requests#show'
  # post '/requests/:id' =>   'requests#checkRequest'
  # put  '/requests/:id' =>   'requests#report'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# /app/app/views/layouts/application.html.erb