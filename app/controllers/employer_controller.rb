class EmployerController < ApplicationController
	def employer_profile
		@ratings = [3.3, 4.5, 4.6, 0.5, 2.2, 4.5]
		@avg = 4
		@projects_created = 6
		@projects_cancelled= 2
		@reviews = ["pays on time", "funny", "good communicator"]

	end
end
