Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :books
      get 'books/collections/:collection', to: 'books#search_collection'
      get 'books/titles/:title', to: 'books#search_title'
      get 'books/isbn/:isbn', to: 'books#search_isbn'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
