class SupportsController < ApplicationController
  def index
  end

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    if @support.valid?
      @support.save
      redirect_to support_path
    else
      render :index
    end
  end

  private

  def support_params
    params.require(:support).permit(:support_title, :prefecture_id, :support_city, :support_address, :support_delivery_date_first, :support_delivery_date_end,:support_person_id, :termination, :feature, :budget, :support_pr, industry_type: []).merge(user_id: current_user.id)
  end

end
