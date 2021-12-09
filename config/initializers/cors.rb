Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://protected-eyrie-39175.herokuapp.com/'
    resource '*', headers: :any, methods: [:get, :post, :show, :head, :delete, :options, :put, :patch], credentials: true
  end
end
