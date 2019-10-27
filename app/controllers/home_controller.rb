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
    service.authorization = token
    @query = Query.find(params["query_id"])
    mail = Mail.new(
      to: params["mail_from"],
      from: 'saumyawardhan1@gmail.com',
      subject: params["subject"],
      body: params["reply_body"],
      )
    mail.header['Reference'] = params['thread_id']
    mail.header['In-Reply-To'] = params['thread_id']

    message_object = Google::Apis::GmailV1::Message.new(raw:mail.encoded)
    result = service.send_user_message('me', message_object)

    if result.label_ids.include? "SENT"
      @query.reply = params["reply_body"]
      @query.replied = true
      @query.save
    end

    redirect_to root_path
  end


end
