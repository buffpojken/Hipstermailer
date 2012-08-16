require 'sinatra'
require 'pony'

get '/mail' do
  'Oh panda, you so funny!'
end


post '/mail' do
	Pony.mail :to       => 'michael.aslander@qubator.com',
		          :from     => params[:beta_request][:email].to_s,
		          :subject  => params[:beta_request][:email] + ' vill ha access till Social Brands.', 			:body => params[:beta_request][:email] + ' vill ha access till Social Brands.',
		          :port     => '587', 
		          :via      => :smtp, 
		          :via_options => {
		            :address                => "smtp.sendgrid.net", 
		            :port                   => "587", 
		            :enable_starttls_auto   => true, 
		            :user_name              => ENV['SENDGRID_USERNAME'], 
		            :password               => ENV['SENDGRID_PASSWORD'], 
		            :authentication         => :plain, 
		            :domain                 => ENV['SENDGRID_DOMAIN']
		          }
    redirect back
end

post '/whispering_beta' do 
  
  if params[:partner]
    subject = params[:email] + " vill bli partner"
    to = "michael.aslander@qubator.com"
  else
    subject = params[:email] + " vill ha access till Whispering Brands."    
    to = "michael.aslander@qubator.com"
  end
  
  Pony.mail :to       => to,
		          :from     => params[:email],
		          :subject  => subject,
		          :body =>  subject,
		          :port     => '587', 
		          :via      => :smtp, 
		          :via_options => {
		            :address                => "smtp.sendgrid.net", 
		            :port                   => "587", 
		            :enable_starttls_auto   => true, 
		            :user_name              => ENV['SENDGRID_USERNAME'], 
		            :password               => ENV['SENDGRID_PASSWORD'], 
		            :authentication         => :plain, 
		            :domain                 => ENV['SENDGRID_DOMAIN']
		          }
    redirect back  
end

## Hipster mailer 1.0
## You probably haven't heard of it.