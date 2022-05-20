Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://diego-salinas-blog.herokuapp.com/'
    resource '*', headers: :any, methods: [:get, :post]
  end
end