module ApplicationHelper
	def page_title(title)
		content_for(:title) || "Inspire"
	end

	def topbar_heading(heading)
		content_for(:heading) || "Dashboard"
	end
end
