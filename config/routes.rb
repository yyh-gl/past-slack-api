Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/channels', to: 'channels#index'
      get '/channels/:channel', to: 'channels#show'
    end
  end
end
