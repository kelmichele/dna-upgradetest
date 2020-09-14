module StatesHelper
	def state_icon
		image_tag('/seals/#{state.name.upcase}.png', class: 'state-icons')
	end

end
