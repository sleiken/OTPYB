get '/' do
	@api_key = ENV['YOUR_API_KEY']
	@places = User.find(session[:id]).places if logged_in?
	erb :index, layout: !request.xhr?
end
