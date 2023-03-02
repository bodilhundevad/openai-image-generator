Rails.application.routes.draw do
  root to: "pages#home"
  post "generate_response", to: "pages#generate_response"
end
