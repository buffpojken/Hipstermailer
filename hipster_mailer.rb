require 'sinatra'
require 'pony'

get '/mail' do
  'Oh panda, you so funny!'
end


post '/mail' do
	if params && params[:beta_request] && (request.env['HTTP_REFERER'] == 'http://socialbrandsmgt.com' || request.env['HTTP_REFERER'] == 'http://www.socialbrandsmgt.com')
		Pony.mail :to => 'beta@socialbrandsmgt.com',
		          :from => params[:beta_request][:email].to_s,
		          :subject => params[:beta_request][:email] + ' vill ha access till Social Brands.', 			:body => params[:beta_request][:email] + ' vill ha access till Social Brands.'
	end
  back
end

## Hipster mailer 1.0
## You probably haven't heard of it.