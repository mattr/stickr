Rails.application.routes.draw do
  get '/search', to: "search#results", as: "search", constraints: { format: ["js", "json"] }
  get '/photo/:id', to: "search#photo", as: "photo", constraints: { format: ["js", "json"] }
  root to: "search#new"
end
