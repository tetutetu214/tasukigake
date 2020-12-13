class CompaniesDetailsController < ApplicationController
  def index
    @company_detail = CompanyDetail.new
  end
end
