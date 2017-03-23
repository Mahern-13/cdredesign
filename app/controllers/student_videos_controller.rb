class StudentVideosController < ApplicationController
  def index
    @response = HTTParty.get("https://api.vimeo.com/users/47788820/videos", headers: {Authorization: "Bearer #{ENV['vimeo_api_key']}"}, query: {per_page: 9, direction: 'desc', sort: 'date'})
    @json = JSON.parse(@response.body)
  end
end
