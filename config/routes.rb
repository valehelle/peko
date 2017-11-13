Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
                              registrations: 'registrations',
  }
  resources :post
  get '/post/find/:query/location/:latitude/:longitude', to: 'post#find', as: 'find_post'
  get '/post/:id/comments', to: 'comment#index', as: 'comments'
  post '/post/:id/comments', to: 'comment#create', as: 'create_comments'
  put '/post/:post_id/comments/:comment_id/select', to: 'comment#select', as: 'select_comment'
  delete '/post/:id/comments/:comment_id', to: 'comment#destroy', as: 'delete_comments'
  resources :comment
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
