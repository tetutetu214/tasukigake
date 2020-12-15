class CompaniesStatusesController < ApplicationController
  def edit
    @company_detail = CompanyStatus.find(params[:id])
  end

  def update
    @company_detail = CompanyStatus.find(params[:id])
    if @company_detail.valid?
      @company_detail.save
      redirect_to companies_details_path
    else
      render :index
    end
  end
end
