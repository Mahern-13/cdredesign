class VolunteersController < ApplicationController
   def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      flash[:notice] = "You will receive an email shortly"
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name,:email,:github,:linked_in)
  end
end
