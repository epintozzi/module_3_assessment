class SearchController < ApplicationController

  def index
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,storeType,distance,city,phone&apiKey="
# binding.pry
    @stores = JSON.parse(response.body, symbolize_names: true)[:stores]

  end

end
