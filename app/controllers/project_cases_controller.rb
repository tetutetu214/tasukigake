class ProjectCasesController < ApplicationController
  def index
  end

  def new
    @project_case = ProjectCase.new
  end

  def create
    @project_case = ProjectCase.new(project_case_params)
    if @project_case.valid?
      @project_case.save
      redirect_to project_case_path
    else
      render :index
    end
  end

  private

  def project_case_params
    params.require(:project_case).permit(:project_case_name, :prefecture_id, :project_address_city, :project_address_address, :project_case_pr).merge(user_id: current_user.id)
  end
end

