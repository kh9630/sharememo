Rails.application.routes.draw do
  scope :api do
    resources :users
    resources :memos
    resources :shortcuts
    resources :stickers
  end
end