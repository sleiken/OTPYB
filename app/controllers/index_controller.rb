get '/' do
	@api_key = ENV['YOUR_API_KEY']
	@places = User.first.places 
	erb :index, layout: !request.xhr?
end
