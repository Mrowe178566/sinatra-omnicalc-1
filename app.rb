require "sinatra"
require "sinatra/reloader"

get '/square/new' do
  erb :square_new
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
  erb(:hello)
end




get '/square/results' do
  @number = params[:number].to_i
  @square = @number ** 2
  erb :square_results
end

get '/square_root/new' do
  erb :square_root_new
end

get '/square_root/results' do
  @number = params[:number].to_i
  @square_root = Math.sqrt(@number)
  erb :square_root_results
end

get '/random/new' do
  erb :random_new
end

get '/random/results' do
  @min = params[:min].to_i
  @max = params[:max].to_i
  @random_number = rand(@min..@max)
  erb :random_results
end

get '/payment/new' do
  erb :payment_new
end

get '/payment/results' do
  apr = params[:apr].to_f / 100 / 12
  years = params[:years].to_i * 12
  present_value = params[:present_value].to_f

  numerator = apr * present_value
  denominator = 1 - (1 + apr) ** -years

  @payment = numerator / denominator
  erb :payment_results
end
