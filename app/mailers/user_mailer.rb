class UserMailer < ActionMailer::Base
	default from: 'pytho834@gmail.com'

	# Subject can be set in your I18n file at config/locales/en.yml
	# with the following lookup:
	#
	# en.user_mailer.welcome_email.subject

	def product_email(product, user)
		@greeting = 'Hi'
		@product = product
		mail to: user.email
	end

	def article_email(title, author, published_date, content, thumbnail, user)
		@author = author
		@published_date = published_date
		@content = content
		@thumbnail = thumbnail
		mail(:to => user.email, :subject => title)
	end

	def article_text_email(title, author, published_date, content, thumbnail, user)
		@author = author
		@published_date = published_date
		@content = content
		@thumbnail = thumbnail
		mail(:to => user.email, :subject => title)
	end

	def contact_text_email(name, email, phone_num, questions, contact, gear, prices, item)
		@greeting = 'Hi'
		@name = name
		@email = email
		@phone_num = phone_num
		@item = item
		@questions = questions
		@contact = contact
		@gear = gear
		@prices = prices
		mail(:to => email, :subject => 'Product questions',
			 bcc: ['dljones@scc.spokane.edu'])
	end

	def contact_email(name, email, phone_num, questions, contact, gear, prices, item)
		@greeting = 'Hi'
		@name = name
		@email = email
		@phone_num = phone_num
		@item = item
		@questions = questions
		@contact = contact
		@gear = gear
		@prices = prices
		mail(:to => email, :subject => 'Product questions',
			 bcc: ['dljones@scc.spokane.edu'])
	end

	def thanks_email(email)
		mail(to: email, :subject => 'Thank you')
	end

end
