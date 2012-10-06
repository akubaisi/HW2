module ApplicationHelper


def title
		if @title.nil?
			@til = "Owners"
		else
			@til = @title
		end
end


end
