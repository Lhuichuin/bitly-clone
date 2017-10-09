get '/' do
	erb :"static/index"
end


post '/urls' do

	short=(('a'..'z').to_a+ ('A'..'Z').to_a+ (0..9).to_a).sample(7).join
	@url= Url.new(long_url: params["long_url"], short_url: short)
	
	if @url.save	
		return @url.to_json
	else
		@message = @url.errors.full_messages.join(",")
		return @message.to_json 
		# erb :"static/errors"
	end
	
end

get "/delete/:id" do
	Url.delete(params["id"])
	redirect '/'
end

get "/contact" do
	erb :"static/contact"
end

get "/about" do
	erb :"static/about"
end

get '/:short_url' do
	#http://localhost:9393/QCFiz4j

	# params = {hc: xxxx}

	@url = Url.find_by(short_url: params[:short_url])
	if @url 

		redirect @url.long_url

	else
		redirect '/'
	end
	# path = request.path_info
	#params[:short_url]
	
	# redirect 'http://'+ Url.where(short_url: path[1..path.length - 1])[0].long_url
	
end
