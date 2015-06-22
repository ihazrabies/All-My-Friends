require "sinatra"

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get "/" do 
	return "hello world"
end

get "/hello" do
	erb :hello_form
end 

post "/hello" do
	greeting = params[:greeting] || "HI THERE"
	greeting2 = params[:greeting2] || "HI THERE"

	erb :index, :locals => {"greeting" => greeting, "greeting2" => greeting2}
end 
