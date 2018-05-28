class ContactsController < ApplicationController
  def new
		@contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Mensaje envíado. Gracias'
    else
      flash.now[:error] = 'Lo lamentamos, no se puede enviar el mensaje'
      render :new
    end
  end
end