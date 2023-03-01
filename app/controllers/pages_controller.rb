require "open-uri"
class PagesController < ApplicationController
  def home
    client = OpenAI::Client.new
    response = client.images.generate(parameters: {
      prompt: "Create a funny cute childrens illustrated storybook image: Once upon a time, there was a curious otter named Olive who loved to swim.",
    })
    @url = response.dig("data", 0, "url")
  end
end
