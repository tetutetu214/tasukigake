class CompaniesStatusesController < ApplicationController
  def index
    @company_status = CompanyStatus.new
  end

  def new
  end

  def create
    @company_status = CompanyStatus.new(company_status_params)
    if @company_status.valid?
      @company_status.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def company_status_params
    params.require(:company_status).permit(:status, :insurance, :companies_pr, license: [], tool: []).merge(user_id: current_user.id)
  end
end
