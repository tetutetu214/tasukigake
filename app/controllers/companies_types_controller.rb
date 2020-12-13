class CompaniesTypesController < ApplicationController
  def index
    @company_type = CompanyType.new
  end
end
