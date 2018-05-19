Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/index' 
  post 'users/create'
  put 'users/update'
  delete 'users/destroy/:id' => 'users#destroy'
  get 'users/show/:id' => 'users#show'
  
  get 'infos/index'
  post 'infos/create'
  put 'infos/update'
  delete 'infos/destroy/:id' => 'infos#destroy'
  get 'infos/show/:id' => 'infos#show'
end
