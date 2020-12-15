class CompaniesTypesController < ApplicationController
  def edit
    @company_type = CompanyType.find(params[:id])
  end

  def update
    @company_type = CompanyType.find(params[:id])
    if @company_type.valid?
      @company_type.save
      redirect_to companies_type_path
    else
      render :index
    end
  end
end
