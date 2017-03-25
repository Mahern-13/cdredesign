class VolunteersController < ApplicationController
  include ApplicationHelper

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      email_alert

      respond_to do |format|
        ExampleMailer.volunteer_email(@volunteer).deliver_later
        format.html { redirect_to (pages_path), notice: 'You will receive an email shortly.' }
      end

    else
      render('new')
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:name,:email,:github,:linked_in)
  end
end
