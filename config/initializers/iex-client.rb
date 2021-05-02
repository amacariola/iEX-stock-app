# iEX client configuration
IEX::Api.configure do |config|
  config.publishable_token = ENV['IEX_API_KEY']
  config.endpoint = 'https://sandbox.iexapis.com/v1'
end
