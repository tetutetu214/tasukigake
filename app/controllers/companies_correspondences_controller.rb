class CompaniesCorrespondencesController < ApplicationController

  def index
    @company_correspondence = CompanyCorrespondence.new
  end

  def new
  end

  def create
    @company_correspondence = CompanyCorrespondence.new(company_correspondence_params)
    if @company_type.valid?
      @company_type.save
      redirect_to  companies_types_path
    else
      render :index
    end 
  end

  private

  def company_correspondence_params
    params.require(:company_correspondence).permit(:prefecture_type =>[]).merge(company_type_id: current_user.id)
  end
end

