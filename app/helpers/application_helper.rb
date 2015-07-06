module ApplicationHelper
	def calendar(year, month)
		current_time = Date.new(year, month)
		cal_str = ''
		cal_str += link_to("Prev Month \n", calendar_path(:month => current_time.prev_month.strftime('%m').to_i, :year => month == 1 ? current_time.prev_year.strftime('%Y').to_i : year), id: 'prev')
		cal_str += link_to("Next Month \n", calendar_path(:month => current_time.next_month.strftime('%m').to_i, :year => month == 12 ? current_time.next_year.strftime('%Y').to_i : year, id: 'next'))
		cal_str += '<h1>'
		cal_str += current_time.strftime('%B %Y')
		cal_str += "</h1>\n"
		cal_str += "<table id='cal'> \n"
		first_of_month = current_time.beginning_of_month.strftime('%w').to_i
		days_of_month = current_time.end_of_month.strftime('%-d').to_i
		last_loop = current_time.end_of_month.strftime('%w').to_i
		last_of_month = (last_loop + 1)
		cal_str += "\t<tr> \n"

		days = %w{Sunday Monday Tuesday Wednesday Thursday Friday Saturday}
		days.each do |day|
			cal_str += "\t\t<td class='color'> #{day} </td> \n"
		end

		cal_str += "\t</tr> \n"
		cal_str += "\t<tr> \n"
		first_of_month.times do
			cal_str += "\t\t<td>&nbsp;</td> \n"
		end
		(7 - first_of_month).times do |day|
			cal_str += "\t\t<td>#{day + 1}</td> \n"
		end
		cal_str += "\t</tr> \n"
		day = 1
		count = 1
		while day <= days_of_month
			cal_str += "\t<tr> \n"
			7.times do
				if day <= days_of_month
					cal_str += "\t\t<td>#{count + (7 - first_of_month)}</td> \n"
					count += 1
					day = count + (7 - first_of_month)
				else
					(7 - last_of_month).times do
						cal_str += "\t\t<td>&nbsp;</td> \n"
					end
					break
				end
			end
			cal_str += "\t</tr> \n"
		end
		cal_str += "</table> \n"

		return cal_str.html_safe
	end

	def navigation
		nav_str = "<nav id='main_nav'> \n"
		nav_str += "\t<ul>\n"
		nav_str += "\t\t<li>" + link_to('Home', root_path) + "</li>\n"
		nav_str += "\t\t<li>" + link_to('About Us', about_us_path) + "</li>\n"
		nav_str += "\t\t<li>" + link_to('Contact Us', contact_us_path) + "</li>\n"
		nav_str += "\t\t<li>" + link_to('Products', store_path) + "</li>\n"
		if user_signed_in?
			nav_str += "\t\t<li>" + link_to('Preferences', edit_user_registration_path) + "</li>\n"
		end
		nav_str += "\t\t<li>" + link_to('Blog', blogs_path) + "</li>\n"
		nav_str += "\t\t<li>" + link_to('Calendar', calendar_path) + "</li>\n"
		nav_str += "\t\t<li>" + link_to('Articles', articles_path) + "</li>\n"
		if user_signed_in?
			nav_str += "\t\t<li>" + link_to('Log out', destroy_user_session_path, :method => 'delete') + "</li>\n"
		else
			nav_str += "\t\t<li>" + link_to('Log in', new_user_session_path) + "</li>\n"
		end
		nav_str += "\t</ul>\n"
		nav_str += "    </nav>\n"

		return nav_str.html_safe
	end
end
