class StudentVideosController < ApplicationController
  def index
    @response = HTTParty.get("https://api.vimeo.com/users/47788820/videos", headers: {Authorization: "Bearer 26d34d40a5941c2f54d5c87bd7ccc4d0"}, query: {per_page: 9, direction: 'desc', sort: 'date'})
    @json = JSON.parse(@response.body)
  end
end
