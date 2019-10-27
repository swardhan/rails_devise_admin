Rails.application.config.middleware.use OmniAuth::Builder do
	  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
	  scope: ['email',
	    	  'https://www.googleapis.com/auth/gmail.modify', 
	    	  'https://www.googleapis.com/auth/gmail.compose',
	    	  'https://www.googleapis.com/auth/gmail.send',
	    	  'https://mail.google.com/'
	    	],
	  access_type: 'offline',
	  skip_jwt: true
	}
end