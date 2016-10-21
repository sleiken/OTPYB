get "/" do
	@api_key = ENV['YOUR_API_KEY']
	@places = User.find(session[:id]).places if logged_in?
	erb :index, layout: !request.xhr?
end

post "/places" do
	place = Place.create!(placeId: params[:placeId][0...-1])
	Visit.create!(user_id: current_user.id, place_id: place.id)
	redirect "/"
end
