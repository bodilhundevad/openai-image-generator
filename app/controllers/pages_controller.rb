require "base64"
require "open-uri"
class PagesController < ApplicationController
  def home
    client = OpenAI::Client.new
      #imageEncoded = Base64.encode64(open(asset_url) { |f| f.read })
    response = client.images.generate(parameters: {
      prompt: "Create a funny cute childrens illustrated storybook image: Once upon a time, there was a curious otter named Olive who loved to swim.",
    })
    @url = response.dig("data", 0, "url")
  end
end
