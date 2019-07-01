Rails.application.routes.draw do
  get 'calendar_items/index'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  get "/graphql", to: "graphql#execute"

  post 'calendar_items/create', to: 'calendar_items#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
