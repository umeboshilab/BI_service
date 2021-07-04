Rails.application.routes.draw do
  post 'users' => 'users/create'
  put  'users/:id' => 'users/update'
  get  '' =>   'users#show'
  pots  '' =>  'users/signin'
  post  '' =>  'tasks#create'
  delete '' => 'tasks#delete'
  get  '' =>   'tasks#show'
  put  '' =>   'tasks#update'
  post '' =>   'requests/create'
  get  '' =>   'requests/show'
  post '' =>   'requests/checkRequest'
  put  '' =>   'requests/report'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
