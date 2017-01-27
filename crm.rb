# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative "contact"
require "sinatra"

# Fake data
Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
Contact.create('The', 'Rock', 'dwyane@wwe.com', 'Muscles')
Contact.create('Kyrie', 'Irving', 'cavs@hotmail.com', 'Best Player Ever')

get "/" do
  @crm_app_name = "Sathes's CRM"
  erb :index
end

get "/contacts" do
  @crm_app_name = "Sathes's CRM"
  erb :contacts
end

get "/contacts/new" do
  @crm_app_name = "Sathes's CRM"
  erb :new_contact
end

post "/contacts" do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to("/contacts")
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)

  puts "LOGGING OUT CONTACT"
  # puts @contact.first_name

  if @contact != nil
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end
