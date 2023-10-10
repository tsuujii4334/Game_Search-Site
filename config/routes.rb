Rails.application.routes.draw do
# ユーザー用
# URL /user/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    root to: 'homes#top'
    get 'user/:id/bookmarks' => 'bookmarks#index', as: 'index_bookmark'
    get 'reviews/:id' => 'reviews#show', as: 'show_review'
    post 'games/:game_id/reviews' => 'reviews#create', as: 'create_review'
    delete 'reviews/:id' => 'reviews#destroy', as: 'destroy_review'
    post 'reviews/:review_id/comments' => 'comments#create', as: 'create_comment'
    delete 'comments/:id' => 'comments#destroy', as: 'destroy_comment'
    get 'games' => 'games#index'
    get 'games/:id' => 'games#show', as: 'show_game'
    get 'users/mypage' => 'users#show', as: 'mypage_user'
    get 'users/edit' => 'users#edit', as: 'edit_user'
    patch 'users' => 'users#update', as: 'update_user'
    get 'users/confirm' => 'users#confirm'
    patch 'users/withdrawal' => 'users#withdrawal'
    get '/' => 'homes#top'
  end

  namespace :admin do
    get 'genres' => 'genres#index'
    post 'genres/create' => 'genres#create'
    get 'genres/:id/edit' => 'genres#edit', as: 'edit_genre'
    patch 'genres/:id' => 'genres#update', as: 'update_genre'
    get 'users' => 'users#index'
    get 'users/:id' => 'users#show', as: 'show_user'
    patch 'users/:id' => 'users#update', as: 'update_user'
    get 'games' => 'games#index'
    get 'games/new' => 'games#new'
    post 'games' => 'games#create', as: 'create_game'
    get 'games/:id' => 'games#show', as: 'show_game'
    get 'games/:id/edit' => 'games#edit', as: 'edit_game'
    patch 'games/:id' => 'games#update', as: 'update_game'
    get 'reviews/:id' => 'reviews#show', as: 'show_review'
    delete 'reviews/:id' => 'reviews#destroy', as: 'destroy_review'
    delete 'comments/:id' => 'comments#destroy',as: 'destroy_comment'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
