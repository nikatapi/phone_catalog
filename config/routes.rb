Phone::Application.routes.draw do
  root to:  'pages#home'
  resources :contacts, except:  [:index]
end
