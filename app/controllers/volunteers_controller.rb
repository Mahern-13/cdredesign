class VolunteersController < ApplicationController
  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    respond_to do |format|
      if @volunteer.save
        
        ExampleMailer.volunteer_email(@volunteer).deliver!

        format.html { redirect_to (pages_path), notice: 'You will receive an email shortly.' }
      else
        render('new')
      end
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name,:email,:github,:linked_in)
  end
end
