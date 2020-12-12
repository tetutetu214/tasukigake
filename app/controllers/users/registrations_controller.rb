# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    render :new and return unless @user.valid?

    session['devise.regist_data'] = { user: @user.attributes }
    session['devise.regist_data'][:user]['password'] = params[:user][:password]
    @company = @user.build_company
    render :new_companies
  end

  def create_companies
    @user = User.new(session['devise.regist_data']['user'])
    @company = Company.new(company_params)
    render :new_companies and return unless @company.valid?

    session['devise.regist_data'] = { user: @user.attributes, company: @company.attributes }
    session['devise.regist_data'][:company] = params[:company]
    @company_detail = @user.build_company_detail
    render :new_companies_details
  end

  def create_companies_details
    @user = User.new(session['devise.regist_data']['user']['company'])
    @company_detail = CompanyDetail.new(company_detail_params)
    render :new_companies_details and return unless @company_detail.valid?
    session['devise.regist_data'] = { user: @user.attributes, company_detail: @company_detail.attributes }
    session['devise.regist_data'][:company_detail] = params[:company_detail]
    @company_type = @user.build_company_type
    render :new_companies_types
  end

  def create_companies_types
    @user = User.new(session['devise.regist_data']['user']['company']['company_detail'])
    @company_type = CompanyType.new(company_type_params)
    render :new_companies_details and return unless @company_type.valid?
    session['devise.regist_data'] = { user: @user.attributes, company_type: @company_type.attributes }
    session['devise.regist_data'][:company_type] = params[:company_type]
    @company_correspondence = @user.build_company_correspondence
    render :new_companies_correspondences
  end

  private

  def company_params
    params.require(:company).permit(:company_name, :postal_code, :prefecture_id, :company_city, :company_address)
  end

  def company_detail_params
    params.require(:company_detail).permit(:division, :representative, :phone_number, :url, :capital, :establishment, :employee, :description, :image)
  end

  def company_type_params
    params.require(:company_type).permit(industry_type: []).merge(user_id: current_user.id)
  end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
