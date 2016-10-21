#NEW
get '/sessions/login/?' do
   erb :'_login.html', layout: !request.xhr?
end

#CREATE
post '/sessions/login/?' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.password == params[:user][:password]
    session[:id] = @user.id
    redirect "/"
  else
    redirect "/"
  end
end

#GET
get '/sessions/logout/?' do
   session[:id] = nil
   redirect "/"
end
