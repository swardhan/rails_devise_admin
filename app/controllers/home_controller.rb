class HomeController < ApplicationController

  APPLICATION_NAME = 'Rails Gmail'
  SCOPE = 'https://www.googleapis.com/auth/gmail.modify'

  def index
  	@queries = Query.all
  end

  def reply
  	service = Google::Apis::GmailV1::GmailService.new
	service.client_options.application_name = APPLICATION_NAME
	token = Token.last.access_token
  end


end
