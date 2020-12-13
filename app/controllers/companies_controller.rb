class CompaniesController < ApplicationController
  def index
    @company = Company.new
  end

  def edit
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
