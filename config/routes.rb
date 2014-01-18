DraftOrder::Application.routes.draw do
  root 'home#index'
  get '/standings/:year/:month/:day', to: 'home#standings', as: :standings, constraints: {year: /201\d/, month: /\d{1,2}/, day: /\d{1,2}/}
end
