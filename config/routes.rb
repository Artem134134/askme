Rails.application.routes.draw do
  post '/questions', to: 'questions#create' 
end
