class CompaniesDetailsController < ApplicationController
  def edit
    @company_detail = CompanyDetail.find(params[:id])
  end

  def update
    @company_detail = Company.find(params[:id])
    if @company_detail.valid?
      @company_detail.save
      redirect_to companies_details_path
    else
      render :index
    end
  end
end
