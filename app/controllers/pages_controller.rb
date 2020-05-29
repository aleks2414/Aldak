class PagesController < ApplicationController

def reporte
  @years = Service.all.group_by(&:year).keys.uniq

  @year = params[:year] || Date.current.year

  @months = Array(1..12)
  if @year.to_s == Date.current.year.to_s
    @month = params[:month] || Date.current.month
  else
    @month = 12
  end

  date = DateTime.new(@year.to_i, @month.to_i, 15) # just a date in the middle of the month

	@services = Service.where(fecha_de_entrega: date.beginning_of_month..date.end_of_month).order(:id).paginate(:page => params[:page])

@records = Service.all.to_a

end

end
