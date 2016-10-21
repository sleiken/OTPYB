get '/users/?' do
  redirect "/"
end

get '/users/new/?' do
  erb :'_new.html', layout: !request.xhr?
end

get '/users/:id/?' do
  @user = User.find(params[:id])
  if current_user == @user
    redirect "/users/#{@user.id}"
  else
    redirect "/"
  end
end


post '/users/?' do
  if params[:user][:password]
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect "/"
    else
      @errors = @user.errors.full_messages
      erb :'_new.html', layout: !request.xhr?
    end
  else
    @errors = "Passwords do not match!"
    erb :'_new.html', layout: !request.xhr?
  end
end
