class SponsorsController < ApplicationController
   def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      flash[:notice] = "You will receive an email shortly"
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:company_name,:company_address,:contact_name,:contact_email,:contact_phone)
  end
end
