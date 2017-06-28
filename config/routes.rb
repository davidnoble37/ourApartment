Rails.application.routes.draw do

  # Homepage:
  root 'users#index'

  # User routes:
  get '/users' => 'users#index', as: :users
  get '/users/new' => 'users#new', as: :new_user
  get '/users/:id' => 'users#show', as: :user
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit', as: :edit_user
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  # Session routes:
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

  # Topic routes:
  get '/topics' => 'topics#index', as: :topics
  get '/topics/new' => 'topics#new', as: :new_topic
  get '/topics/:topic_id' => 'topics#show', as: :topic
  post '/topics' => 'topics#create'
  get '/topics/:topic_id/edit' => 'topics#edit', as: :edit_topic
  patch '/topics/:topic_id' => 'topics#update'
  delete '/topics/:topic_id' => 'topics#destroy'

  # Message routes:
  get '/topics/:topic_id/messages' => 'messages#index', as: :topic_messages
  get '/topics/:topic_id/messages/new' => 'messages#new', as: :topic_new_message
  get '/topics/:topic_id/messages/:message_id' => 'messages#show', as: :topic_message
  post '/topics/:topic_id/messages' => 'messages#create'
  get '/topics/:topic_id/messages/:message_id/edit' => 'messages#edit', as: :topic_edit_message
  patch '/topics/:topic_id/messages/:message_id' => 'messages#update'
  delete '/topics/:topic_id/messages/:message_id' => 'messages#destroy'

  # Reply routes:
  get '/topics/:topic_id/messages/:message_id/replies' => 'replies#index', as: :topic_message_replies
  get '/topics/:topic_id/messages/:message_id/replies/new' => 'replies#new', as: :topic_message_new_reply
  get '/topics/:topic_id/messages/:message_id/replies/:reply_id' => 'replies#show', as: :topic_message_reply
  post '/topics/:topic_id/messages/:message_id/replies' => 'replies#create'
  get '/topics/:topic_id/messages/:message_id/replies/:reply_id/edit' => 'replies#edit', as: :topic_message_edit_reply
  patch '/topics/:topic_id/messages/:message_id/replies/:reply_id' => 'replies#update'
  delete '/topics/:topic_id/messages/:message_id/replies/:reply_id' => 'replies#destroy'

  # resources :topics do
  #   resources :messages do
  #     resources :replies
  #   end
  # end

end
