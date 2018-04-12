Rails.application.routes.draw do

  

  devise_for :users
  authenticated :user do
    root 'static_pages#dashboard', as: :authenticated_root
  end
  root to: "forum_threads#index"
  get "profile/:user", to: "users#show"
  get "forum/category/:category", to: "forum_threads#category" 
  resources :forum_threads, :path => 'forum' do
    resources :forum_posts do
      get "/solved", to: "forum_posts#solved"
      get "/unsolved", to: "forum_posts#unsolved" 
    end
  end

end
