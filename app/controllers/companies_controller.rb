class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @company = Company.new
    @company_detail = CompanyDetail.new
    @user = @company_detail.user_id
  end

  def edit
    @company = Company.find(params[:id])
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
