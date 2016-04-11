Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :post_attachments
  resources :posts
  




  

  root 'post_attachments#index'
  match "/uploads/:id/:basename.:extension", :controller => "post_attachments", :action => "download", via: :get
end
