class AdminController < ApplicationController

	before_action :authenticate_user!, :require_admin

	def admin_panel
		@queries = Query.all
		@users = User.all
	end

	def update_query
		@query = Query.find(params["query_id"])
		@query.user_id = params["user_id"]
		@query.save
		redirect_back(fallback_location: admin_path)
	end

	private

	def require_admin
		unless current_user.admin
			flash[:error] = "You must be an Admin to access this section"
			redirect_to new_user_session_path
		end
	end
end
