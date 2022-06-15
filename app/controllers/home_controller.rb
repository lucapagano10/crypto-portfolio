class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    #require 'coingecko_ruby'
    require 'cryptocompare'

    #@url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/map?CMC_PRO_API_KEY=6ac2d474-e89c-4ae2-8f1d-c44ffa0850c5'
    #@uri = URI(@url)
    #@response = Net::HTTP.get(@uri)
    #@coins = JSON.parse(@response)
    #@client = CoingeckoRuby::Client.new
    @client = Cryptocompare::Price.find('ETH', 'USD', { api_key: 'API_KEY' })
    @tickers = ["BTC", "ETH", "XRP"]
  end

  def about
  end

  def lookup
    require 'net/http'
    require 'json'
    #require 'coingecko_ruby'
    require 'cryptocompare'
    @tickers = ["BTC", "ETH", "XRP"]
    @symbol = params[:sym]
    if @symbol
      @symbol = @symbol.upcase
    end
    if @symbol == ""
      @symbol = "Type your symbol!"
    end
  end
end
