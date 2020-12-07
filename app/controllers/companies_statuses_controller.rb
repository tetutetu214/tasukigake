class CompaniesStatusesController < ApplicationController
  def index
    @company_status = CompanyStatus.new
  end

  def new
  end

  def create
    @company_status = CompanyType.new(company_status_params)
    if @company_status.valid?
      @company_status.save
      redirect_to  companies_types_path
    else
      render :index
    end 
  end

  private

  def company_status_params
    params.require(:company_status).permit(:industry_type =>[]).merge(user_id: current_user.id)
  end
end
