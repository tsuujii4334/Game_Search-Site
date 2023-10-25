Rails.application.routes.draw do
# ユーザー用
# URL /user/sign_in ...
devise_for :users,skip: :all
devise_scope :user do
  get 'users/sign_up' => 'public/registrations#new', as: :new_user_registration
  post 'users/sign_up' => 'public/registrations#create', as: :create_user_registration
  get 'users/sign_in' => 'public/sessions#new', as: :new_user_session
  post 'users/sign_in' => 'public/sessions#create', as: :create_user_session
  delete 'users/sign_out' => 'public/sessions#destroy', as: :destroy_user_session
end
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: :all
devise_scope :admin do
  get 'admin/sign_in' => 'admin/sessions#new', as: :new_admin_session
  post 'admin/sign_in' => 'admin/sessions#create', as: :create_admin_session
  delete 'admin/logout' => 'admin/sessions#destroy', as: :destroy_admin_session
end

  
  
  scope module: :public do
    root to: 'homes#top'
    delete 'bookmarks/:bookmark_id' => 'bookmarks#destroy', as: 'destroy_bookmark'
    post 'games/:game_id/bookmarks' => 'bookmarks#create', as: 'create_bookmark'
    get 'user/:id/bookmarks' => 'bookmarks#index', as: 'index_bookmark'
    get 'reviews/:review_id' => 'reviews#show', as: 'show_review'
    post 'games/:game_id/reviews' => 'reviews#create', as: 'create_review'
    delete 'reviews/:review_id' => 'reviews#destroy', as: 'destroy_review'
    post 'reviews/:review_id/comments' => 'comments#create', as: 'create_comment'
    delete 'comments/:comment_id' => 'comments#destroy', as: 'destroy_comment'
    get 'games' => 'games#index'
    get 'games/:game_id' => 'games#show', as: 'show_game'
    get 'users/mypage' => 'users#show', as: 'mypage_user'
    get 'users/edit' => 'users#edit', as: 'edit_user'
    patch 'users' => 'users#update', as: 'update_user'
    get 'users/confirm' => 'users#confirm'
    patch 'users/withdrawal' => 'users#withdrawal'
    get '/' => 'homes#top'
    get "search" => "searches#search"
    get 'searches/index'
  end

  namespace :admin do
    get 'genres' => 'genres#index'
    post 'genres/create' => 'genres#create'
    get 'genres/:genre_id/edit' => 'genres#edit', as: 'edit_genre'
    patch 'genres/:genre_id' => 'genres#update', as: 'update_genre'
    get 'users' => 'users#index'
    get 'users/:id' => 'users#show', as: 'show_user'
    patch 'users/:id' => 'users#update', as: 'update_user'
    get 'games' => 'games#index'
    get 'games/new' => 'games#new'
    post 'games' => 'games#create', as: 'create_game'
    get 'games/:game_id' => 'games#show', as: 'show_game'
    delete 'games/:game_id/' => 'games#destroy', as: 'destroy_game'
    get 'games/:game_id/edit' => 'games#edit', as: 'edit_game'
    patch 'games/:game_id' => 'games#update', as: 'update_game'
    get 'reviews/:review_id' => 'reviews#show', as: 'show_review'
    delete 'reviews/:review_id' => 'reviews#destroy', as: 'destroy_review'
    delete 'comments/:comment_id' => 'comments#destroy',as: 'destroy_comment'
    get "search" => "searches#search"
    get 'searches/index'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
