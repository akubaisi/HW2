module ApplicationHelper


def title
		if @title.nil?
			@til = "Owners"
		else
			@til = @title
		end
end

def set_title
	@title ? "QATS :: #{@title}" : "QATS :: Doha"
end

end
