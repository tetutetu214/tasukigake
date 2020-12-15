class CompaniesCorrespondencesController < ApplicationController
  def edit
    @company_correspondences = CompanyCorrespondence.find(params[:id])
  end

  def update
    @company_correspondences = CompanyCorrespondence.find(params[:id])
    if @company_correspondences.valid?
      @company_correspondences.save
      redirect_to companies_correspondencess_path
    else
      render :index
    end
  end
end
