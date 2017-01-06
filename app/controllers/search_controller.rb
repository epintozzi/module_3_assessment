class SearchController < ApplicationController

  def index
    zip = params[:search].to_i

    # response = StoreFinderService.new.get_response(zip)
    # binding.pry
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=longName,storeType,distance,city,phone&apiKey=#{ENV['BEST_BUY_KEY']}"

    response = JSON.parse(response.body, symbolize_names: true)

    @stores = response[:stores]
    @total = response[:total]
  end

end
