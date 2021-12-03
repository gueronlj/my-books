Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '/session', headers: :any, methods: [:get, :post, :show]
  end
end
