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
    session["notes"] << params["rubrik"]
    session["notes"] << params["author"]
    session["notes"] << params["ny_note"]

  else
    session["notes"] << params["rubrik"]
    session["notes"] << params["author"]
    session["notes"] << params["ny_note"]

  end
  redirect('/notes')
end

#Visa alla notes
get('/notes') do
  slim(:"notes/show")
end

post('/newuser') do
  session["user"] = params["username"]
  session["password"] = params["password"]
  redirect("/")
end

get('/dokumentation') do
  slim(:"dokumentation/dokumentation")
end

get('/delete_notes') do
  session["notes"] = nil
  redirect('/notes')
end

post('/login') do
  if session["password"] == params["password"]
    redirect ('/notes/new') 
  else 
    "fel lösenord"
  end
end

get('/login') do
  slim(:"user/login")
end

