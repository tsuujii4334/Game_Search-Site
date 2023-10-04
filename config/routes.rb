Rails.application.routes.draw do
# 顧客用
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
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'games/index'
    get 'games/new'
    get 'games/show'
    get 'games/edit'
    get 'reviews/show'
  end
  namespace :public do
    root to: 'homes#top'
    get 'bookmarks/index'
    get 'reviews/show'
    get 'games/index'
    get 'games/show'
    get 'users/show'
    get 'users/edit'
    get 'users/confirm'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
