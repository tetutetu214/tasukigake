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
      redirect_to supports_path
    else
      render :new
    end
  end

  private

  def support_params
    params.require(:support).permit(:support_title, :support_delivery_date_first, :support_delivery_date_end, :support_person_id, :termination, :support_pr, prefecture_type: [], industry_type: [], feature: []).merge(user_id: current_user.id)
  end
end
