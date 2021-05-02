class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :brokers, class_name: "User", through: :user_stocks, source: :user

  #has_many :buyer_stocks
  #has_many :users, through: :buyer_stocks

  has_many :transactions
  has_many :buyers, class_name: "User", through: :transactions

  validates :name, :ticker, presence: true
  

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      quote = client.quote(ticker_symbol)
      quote.latest_price
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, latest_price: quote.latest_price)
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.news_microsoft
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      news = client.news('MSFT')
      news.first
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end
  
  def self.news_apple
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      news = client.news('AAPL')
      news.first
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end
  
  def self.news_google
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      news = client.news('GOOGL')
      news.first   
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end


#############################################
#                                           #
#        FETCH CRYPTOCURRENCY STATS         #   
#                                           #
#############################################

  def self.crypto_btc
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      bitcoin = client.crypto('BTCUSDT')
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end

  def self.crypto_eth
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      bitcoin = client.crypto('ETH')
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end

  
  def self.crypto_ltc
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      bitcoin = client.crypto('LTC')
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end
  
  def self.crypto_dash
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      bitcoin = client.crypto('DASH')
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end

#############################################
#                                           #
#        TOP COMPANY STATISTICS             #   
#                                           #
#############################################


  def self.quotes_microsoft
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      trade = client.quote('MSFT')
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end
  
  def self.quotes_apple
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      trade = client.quote('AAPL')
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end
  
  def self.quotes_google
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      trade = client.quote('GOOGL')
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end

  def self.quotes_tesla
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      trade = client.quote('TSLA')
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end
  
  def self.quotes_amazon
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      trade = client.quote('AMZN')
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end
 
  
  def self.market_suggestions
    client = IEX::Api::Client.new(publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      list = client.stock_market_list(:mostactive)
    rescue IEX::Errors::SymbolNotFoundError
      return nil
    end
  end
end 


