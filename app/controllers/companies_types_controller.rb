class CompaniesTypesController < ApplicationController
  def index
    @company_type = CompanyType.new
  end

  def new
  end

  def create
    @company_type = CompanyType.new(company_type_params)
    if @company_type.valid?
      @company_type.save
      redirect_to companies_correspondences_path
    else
      render :index
    end
  end

  private

  def company_type_params
    params.require(:company_type).permit(industry_type: []).merge(user_id: current_user.id)
  end
end
