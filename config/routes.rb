Rails.application.routes.draw do
  resources :question_answers
  root 'question_answers#index'
end
