require "sinatra"
require "sinatra/reloader"
require "bigdecimal"
require "bigdecimal/util"

get("/") do
  erb(:hello)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = Math.sqrt(@the_num)

  erb(:square_root_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

post("/random/results") do
  @min = params.fetch("min", nil).to_i
  @max = params.fetch("max", nil).to_i

  # Ensure min < max, and handle any potential issues
  if @min.nil? || @max.nil? || @min >= @max
    @error = "Please enter valid minimum and maximum values, and ensure that min < max."
    erb(:new_random_calc)
  else
    @result = rand(@min..@max)
    erb(:random_results)
  end
end



get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @apr = BigDecimal(params.fetch("apr")) / 100 / 12
  @years = params.fetch("years").to_i
  @present_value = BigDecimal(params.fetch("present_value"))
  @n = @years * 12

  @payment = (@apr * @present_value) / (1 - (1 + @apr) ** -@n)

  erb(:payment_results)
end
