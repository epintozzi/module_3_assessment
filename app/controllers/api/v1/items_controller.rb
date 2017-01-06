class Api::V1::ItemsController < ApiController

  def index
    render json: Item.all
  end

end
