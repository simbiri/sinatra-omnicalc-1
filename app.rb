require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get ("/square/new") do
  erb(:square)
end

get("/square/results")do
  @num = params.fetch("number").to_f
  @num_sq = @num ** 2
  erb(:squarres)
end

get ("/square_root/new") do
  erb(:sqroot)
end

get ("/square_root/results") do
  @num = params.fetch("user_number").to_f
  @num_sq = Math.sqrt(@num)
  erb(:sqrootres)
end

get ("/payment/new") do
  erb(:payment)
end

get ("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @princi = params.fetch("user_pv").to_i

  rate = @apr/1200
  n = @years * 12
  numerator = rate * @princi
  denominator = 1 - (1 + rate)**(-n)

  @payment = (numerator/denominator).to_fs(:currency)
  erb(:payres)
end

get ("/random/new") do
  erb(:random)
end

get ("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  @rando = rand(@min..@max)

  erb(:randomres)
end
