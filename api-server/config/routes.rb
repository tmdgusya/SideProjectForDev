Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'api/join' => 'user#join'
  post 'api/login' => 'user#login'

  get 'git-oauth' => 'user#git_login'

end
