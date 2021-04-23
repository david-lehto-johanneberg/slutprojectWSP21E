require 'sinatra'
require 'slim'

enable :sessions







#Startsida
get('/') do
  slim(:index)
end
get('/change_user') do
  slim(:"user/newuser")
end

#Visa formulär som lägger till en note
get('/notes/new') do
  slim(:"notes/new")
end


#Skapa note
post('/notes/create') do
  if session["notes"] == nil
    session["notes"] = []
    session["notes"] << params["ny_note"]
  else
    session["notes"] << params["ny_note"]
  end
  redirect('/notes')
end

post('/notes/create_author') do
  if session["author"] == nil
    session["author"] = []
    session["author"] << params["author"]
  else
    session["author"] << params["author"]
  end
  redirect('/notes')
end

post('/notes/create_rubrik') do
  if session["rubrik"] == nil
    session["rubrik"] = []
    session["rubrik"] << params["rubrik"]
  else
    session["rubrik"] << params["rubrik"]
  end
  redirect('/notes')
end

#Visa alla notes
get('/notes') do
  slim(:"notes/show")
end

post('/newuser') do
  session["user"] = params["username"]
  redirect("/")
end
