Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://mybooks-frontend.herokuapp.com"
    resource '*', headers: :any, methods: [:get, :post, :show, :head, :delete, :options, :put, :patch], credentials: true
  end

  allow do
    origins "http://localhost:3000"
    resource '*', headers: :any, methods: [:get, :post, :show, :head, :delete, :options, :put, :patch], credentials: true
  end
end
