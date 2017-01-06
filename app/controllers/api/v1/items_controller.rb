class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.delete
      render json: {status: 204}
    else
      render json: {status: :failure}
    end
  end

  def create
    item = Item.create(item_params)

    respond_to do |format|
      if item.save
        format.html {redirect_to destination}
        format.json {render json: item}
      else
        format.html {render action: 'new'}
        format.json {render json: item.errors, status: :failure}
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :image_url, :description)
  end

end
