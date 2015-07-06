class PageController < ApplicationController

	def about_us

	end

	def contact_us
		@item = Product.all
		@item_selected = params[:item]
		@contact = params[:contact]
		@email = params[:email]
		@commit = params[:commit].nil? ? false : true
		@name = params[:name]
		@phone_num = params[:phone_num]
		@gear = params[:gear]
		@prices = params[:prices]
		@questions = params[:questions]
		if @name && @name.empty? && @email && @email.empty?
			flash[:notice] = 'Name and E-mail is Required'
		else
			flash[:notice] = nil
		end

		if @commit
			UserMailer.contact_email(@name, @email, @phone_num, @questions, @contact, @gear, @prices, @item_selected).deliver
			UserMailer.contact_text_email(@name, @email, @phone_num, @questions, @contact, @gear, @prices, @item_selected).deliver
			UserMailer.thanks_email(@email).deliver
			redirect_to(contact_us_path, :notice => 'Email sent successfully.')
		end
	end

	def calendar
		@year = params[:year].to_i
		@month = params[:month].to_i

		if @year == 0
			@year = Time.now.strftime('%Y').to_i
		end

		if @month == 0
			@month = Time.now.strftime('%m').to_i
		end
	end

	def login
		@name = params[:name]
		@phone_num = params[:phone_num]
	end
end
