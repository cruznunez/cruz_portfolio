Rails.application.routes.draw do
  root 'pages#home'
  get 'projects' => 'pages#projects'
  get 'resume' => 'pages#resume'
end
