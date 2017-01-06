require "rails_helper"

describe "items endpoints" do
  context "GET /items" do
    it "returns list of items" do
      create_list(:item, 3)

      get '/api/v1/items'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
    end
    it "returns a single item" do
      id = create(:item).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["id"]).to eq(id)
    end
  end
  context "DELETE /items" do
    it "deletes an item" do
      item_1, item_2 = create_list(:item, 2)

      delete "api/v1/items/#{item_1.id}"

      expect(response).to be_success
    end
  end
  context "POST /items" do
    it "creates an item" do
      params = {name: "new item", description: "description", image_url: "test.png"}

      post "api/v1/items"

      expect(response).to be_success
    end
  end
end
