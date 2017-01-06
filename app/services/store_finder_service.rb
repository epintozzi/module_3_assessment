class StoreFinderService
  attr_reader :conn

  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com/v1/stores') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_response(zip)
    response = conn.get("(area(#{zip},25))?format=json&show=longName,storeType,distance,city,phone&apiKey=#{ENV['BEST_BUY_KEY']}")
    # binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

end
