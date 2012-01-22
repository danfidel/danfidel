InterviewTestApp::Application.routes.draw do
  # The default landing page is users#index.
  root :to => redirect('/users')

  resources :users do
    get :test_password
    get :authenticate
  end
end
