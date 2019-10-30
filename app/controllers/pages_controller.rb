class PagesController < ApplicationController

def reporte
	@services = Service.all.order('id ASC')
	@services = @services.paginate(:page => params[:page], :per_page => 10)
end

end
