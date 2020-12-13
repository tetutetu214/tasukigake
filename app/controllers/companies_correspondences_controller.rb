class CompaniesCorrespondencesController < ApplicationController
  def index
    @company_correspondence = CompanyCorrespondence.new
  end

end
