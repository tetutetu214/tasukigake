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
      redirect_to  companies_types_path
    else
      render :index
    end 
  end

  private

  def company_type_params
    params.require(:company_type).permit(:industry_type =>[]).merge(company_detail_id: current_user.id)
  end
end




・コントローラー側：複数チェックの情報を格納して送付する記述

controller側の記述
``` 
def create
 @company_type = CompanyType.new(company_type_params)
 if @company_type.valid?
 @company_type.save
 redirect_to companies_types_path
 else
 render :index
 end
end

private

def company_type_params
 params.require(:company_type).permit(:industry_type =>[]).
 merge(company_detail_id: current_user.id)
end
``` 

 ・このように保存されています


gyazo.com
