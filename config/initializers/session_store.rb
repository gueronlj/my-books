if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_mybooks-frontend', domain: 'http://localhost:3000'
else
  Rails.application.config.session_store :cookie_store, key: '_mybooks-frontend'
end
