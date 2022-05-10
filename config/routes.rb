Rails.application.routes.draw do
  post '/questions', to: 'questions#create' 
  patch '/questions/:id', to:'questions#update'
end
