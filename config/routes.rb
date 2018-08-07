Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/channels/public', to: 'channels#public_index'
      get '/channels/private', to: 'channels#private_index'
      get '/channels/:channel', to: 'channels#show'

      get '/messages', to: 'messages#index'
      get '/messages/search', to: 'messages#show'

      get '/users', to: 'users#index'
    end
  end

  namespace :api do
    namespace :v2 do
      get '/channels/public', to: 'channels#public_index'
      get '/channels/private', to: 'channels#private_index'
      get '/channels/:channel', to: 'channels#show'

      get '/messages', to: 'messages#index'
      get '/messages/search', to: 'messages#show'

      get '/users', to: 'users#index'
    end
  end
end
