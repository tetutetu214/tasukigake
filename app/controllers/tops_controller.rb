class TopsController < ApplicationController
  def index
    @company = Company.all
  end


end
