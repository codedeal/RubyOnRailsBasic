Rails.application.routes.draw do
  get 'admin_users/index'

  get 'admin_users/new'

  get 'admin_users/edit'

  get 'admin_users/delete'

  get 'access/index'

  get 'access/login'

  get 'demo/index'

  get 'demo/search'

  get 'demo/about'

  get 'sections/index'

  get 'sections/show'

  get 'sections/new'

  get 'sections/edit'

  get 'sections/delete'

  get 'pages/index'

  get 'pages/show'

  get 'pages/new'

  get 'pages/edit'

  get 'pages/delete'

  get 'subjects/index'

  get 'subjects/show'

get 'subjects/new'

  get 'subjects/edit'

  get 'subjects/delete'
  #match ':controller(/:action(/:id))', :via=> :get
match ':controller(/:action(/:id))', :via=> [:get, :post]
#root 'subjects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
