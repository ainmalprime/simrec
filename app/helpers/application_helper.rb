module ApplicationHelper
	def color(hex)
		unless hex < 0	
		  "#%06x" % hex
		else
			"#000000"
		end
	end
end