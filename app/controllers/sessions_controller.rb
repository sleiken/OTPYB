#NEW

get '/sessions/login/?' do
   erb :'sessions/_login.html', layout: !request.xhr?
end

#CREATE

post '/sessions/login/?' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.password == params[:user][:password]
    if request.xhr?
      session[:id] = @user.id
      erb :'/headers/_header_links.html', layout: false
    # else
    #   @errors = "Email & Password not found"
    #   erb :'/sessions/_login.html', layout: !request.xhr?
    end
  end
end

# DELETE

delete '/sessions/logout/?' do
   session[:id] = nil
   erb :'/headers/_header_links.html', layout: !request.xhr?
end
