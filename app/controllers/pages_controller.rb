class PagesController < ApplicationController
  def index
    @student = Student.new
    @sponsor = Sponsor.new
    @volunteer = Volunteer.new
  end
end
