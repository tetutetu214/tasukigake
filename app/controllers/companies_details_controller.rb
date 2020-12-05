class CompaniesDetailsController < ApplicationController
  def index
    @company_detail = CompanyDetail.new
  end

  def new
  end

  def create
    @company_detail = CompanyDetail.new(company_detail_params)
    if @company_detail.valid?
      @company_detail.save
      redirect_to  companies_details_path
    else
      render :index
    end 
  end

  private

  def company_detail_params
    params.require(:company_detail).permit(:division, :representative, :phone_number, :url, :capital,:establishment, :employee, :description).merge(company_id: current_user.id)
  end
end
