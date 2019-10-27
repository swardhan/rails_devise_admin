class AdminController < ApplicationController

	before_action :authenticate_user!, :require_admin
	APPLICATION_NAME = 'Rails Gmail'
	SCOPE = 'https://www.googleapis.com/auth/gmail.modify'

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

	def load_queries

		service = Google::Apis::GmailV1::GmailService.new
		service.client_options.application_name = APPLICATION_NAME
		token = Token.last.access_token
		service.authorization = token
		result = service.list_user_messages('me', include_spam_trash: false, max_results: 20)
		messages = result.messages
		messages.each do |message|
			if !Query.exists?(mail_id: message.id)
				mail = service.get_user_message('me', message.id, format: 'metadata')
				body = mail.snippet
				subject = ""
				from = ""
				mail.payload.headers.each do |h|
					if h.name == 'Subject'
						subject = h.value					
					end
					if h.name == "From"
						from = h.value.split("<").last.split(">").first
					end
				end
				Query.create!(body: body, mail_id: message.id, thread_id: message.thread_id,
					mail_from: from, subject: subject)
			end
		end

		redirect_to admin_path
	end

	private

	def require_admin
		unless current_user.admin
			flash[:error] = "You must be an Admin to access this section"
			redirect_to new_user_session_path
		end
	end
end
