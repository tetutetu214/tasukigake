class CompaniesController < ApplicationController
  def index
    @company = Company.new
    @company_detail = CompanyDetail.new
    @user = @company_detail.user_id
  end

  def edit
    @company = current_user.id
  end

  def update
    @company = Company.find(params[:id])
    if @company.valid?
      @company.save
      redirect_to companies_details_path
    else
      render :index
    end
  end
end
