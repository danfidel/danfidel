InterviewTestApp::Application.routes.draw do
  # The default landing page is users#index.
  root :to => redirect('/users')

  resources :users do
    get :test_password
    put :authenticate     # The HTTP verb is 'put' so that the password being tested is not visible in the URL's query params
  end
end
