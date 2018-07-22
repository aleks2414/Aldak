class PagesController < ApplicationController

def reporte
	@services = Service.all.order('id ASC')
end

end
