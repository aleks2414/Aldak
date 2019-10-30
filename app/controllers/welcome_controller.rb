class WelcomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@services1 = Service.where(etapa: 1).order('id ASC')
  	@services1 = @services1.paginate(:page => params[:page], :per_page => 10)
  	@services2 = Service.where(etapa: 2).order('id ASC')
  	@services2 = @services2.paginate(:page => params[:page], :per_page => 10)
  	@services3 = Service.where(etapa: 3).order('id ASC')
  	@services3 = @services3.paginate(:page => params[:page], :per_page => 10)
  	@services4 = Service.where(etapa: 4).order('id ASC')
  	@services4 = @services4.paginate(:page => params[:page], :per_page => 10)
  	@services5 = Service.where(etapa: 5).order('id ASC')
  	@services5 = @services5.paginate(:page => params[:page], :per_page => 10)
  	@services6 = Service.where(etapa: 6).order('id ASC')
  	@services6 = @services6.paginate(:page => params[:page], :per_page => 10)
  end
end
