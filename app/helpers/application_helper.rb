module ApplicationHelper

	def phone
	  number_to_phone(18667504773, delimiter: ' ', area_code: true,  class: "phone-link", id: "number_link", onclick: "ga('send', 'event', 'Phone Number', 'Clicked to Call', 'Number on Website', '1')")
	end

	def online_status(user)
	  content_tag :span, user.name,
	              class: "user-#{user.id} online_status #{'online' if user.online?}"
	end

	def admin_online_status(boss_admin)
		if boss_admin.online?
			admin_online_status = 'Online: Chat With Us'
		else
			admin_online_status = 'Offline: Leave us a message.'
		end
	  # content_tag :span, boss_admin.boss_title,
	              # class: "admin_online_status #{'online' if boss_admin.online?}"
	end

	def chatrooms_windows
	  params[:controller] != '' ? @chatrooms_windows : []
	end

	def chat_or_account_path
	  if !user_signed_in?
	    'layouts/pre-panel'
	  else
	    'layouts/chatrooms_windows'
	  end
	end

end
