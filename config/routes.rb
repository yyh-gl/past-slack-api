Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/channels/public', to: 'channels#api_public_index'
      get '/channels/private', to: 'channels#api_private_index'
      get '/channels/:channel', to: 'channels#api_show'
      get '/channels/db/public', to: 'channels#db_public_index'
      get '/channels/db/private', to: 'channels#db_private_index'
      get '/channels/db/:channel', to: 'channels#db_show'

      get '/messages', to: 'messages#save_all_messages'
    end
  end
end
