class WelcomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@services1 = Service.where(etapa: 1).order('id ASC')
  	@services2 = Service.where(etapa: 2).order('id ASC')
  	@services3 = Service.where(etapa: 3).order('id ASC')
  	@services4 = Service.where(etapa: 4).order('id ASC')
  	@services5 = Service.where(etapa: 5).order('id ASC')
  	@services6 = Service.where(etapa: 6).order('id ASC')
  end
end
