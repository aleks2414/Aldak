class Contact < MailForm::Base

	attribute :name, 					:validate => false
	attribute :email, 				:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :phone,     		:validate => false
	attribute :donde, 		   	:validate => false
	attribute :comments, 			:validate => false
	attribute :nickname, 			:captcha => true

def headers 
	{
	:subject => "Nueva Confirmación",
	:to => "alex@idearialab.com",
	# :cc => "alejandroromo14@gmail.com",
	:from => %("#{name}" <#{email}>)
	}
	end
end