class CompaniesController < ApplicationController
  
  def index
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.valid?
      @company.save
      redirect_to  companies_details_path
    else
      session["company.regist_data"] = {company: @company.attributes}
      session["company.regist_data"][:company] = params[:company]
      binding.pry
      @company_detail = @user.build_company_detail
      render :new_address
    end 
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :postal_code, :prefecture_id, :company_city, :company_address).merge(user_id: current_user.id)
  end

end
