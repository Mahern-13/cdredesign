class SponsorsController < ApplicationController
  include ApplicationHelper
  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      email_alert

      respond_to do |format|
        ExampleMailer.sponsor_email(@sponsor).deliver_later
        format.html { redirect_to (pages_path) }
        flash[:notice] = 'You will receive an email shortly.'
      end
    else
      render('new')
    end

  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:company_name,:company_address,:contact_name,:contact_email,:contact_phone)
  end
end
