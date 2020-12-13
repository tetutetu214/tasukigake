class CompaniesStatusesController < ApplicationController
  def index
    @company_status = CompanyStatus.new
  end

end
