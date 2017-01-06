class SearchController < ApplicationController

  def index
    zip = params[:search].to_i

    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,storeType,distance,city,phone&apiKey=#{ENV['BEST_BUY_KEY']}"

    response = JSON.parse(response.body, symbolize_names: true)
    # @stores = JSON.parse(response.body, symbolize_names: true)[:stores]

    @stores = response[:stores]
    @total = response[:total]
  end

end
