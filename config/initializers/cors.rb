# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://book-share-front-fw52.vercel.app','http://localhost:3000'
    resource '*', headers: :any, methods: %i[get post put patch delete options head]
  end
end
