if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_mybooks-frontend', domain: 'https://protected-eyrie-39175.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_mybooks-frontend'
end
