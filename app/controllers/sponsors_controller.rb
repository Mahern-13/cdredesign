class SponsorsController < ApplicationController
   def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    respond_to do |format|
      if @sponsor.save
        ExampleMailer.sponsor_email(@sponsor).deliver!

        format.html { redirect_to (pages_path), notice: 'You will receive an email shortly.' }
      else
        render('new')
      end
    end
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:company_name,:company_address,:contact_name,:contact_email,:contact_phone)
  end
end
