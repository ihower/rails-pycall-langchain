Rails.application.routes.draw do

  resources :chats, :controller => "conversations" do
    resources :messages
  end

  resources :documents

  root "conversations#index"

end
