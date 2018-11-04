class ApplicantController < ApplicationController
	def applicant_profile
		@avg_rating = 4.3
		@ratings = [3.3, 4.5, 4.6, 4.3]
		@projects_completed = 6
		@no_show = 2
		@reviews = ["punctual", "polite", "good with hands"]
		# ruby variable into js
	end
end
