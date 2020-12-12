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

  private

  def company_params
    params.require(:company).permit(:company_name, :postal_code, :prefecture_id, :company_city, :company_address).merge(user_id: current_user.id)
  end
end
