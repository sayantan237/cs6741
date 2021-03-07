### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 07061a40-7f4a-11eb-057a-c1e82802e46b
using DataFrames

# ╔═╡ c6dcf912-7f4a-11eb-2364-f362943ecc47
using HTTP

# ╔═╡ d30723a0-7f4a-11eb-23bf-cb69061fcc6f
using JSON

# ╔═╡ da213950-7f4a-11eb-0dfa-cb603d195f2d
using JSONTables

# ╔═╡ d26db2b0-7f5e-11eb-21a1-d1402292601b
begin
	using Plots
	pyplot()
end

# ╔═╡ ed8c6b10-7f61-11eb-1b48-65b262cbd0de
using TimeSeries

# ╔═╡ cdff30d0-7f65-11eb-0bec-07eda6f5acd0
using Statistics

# ╔═╡ 0251c480-7f4b-11eb-25bc-8944d94def76
begin
	resp = HTTP.request("GET", "https://api.covid19india.org/data.json"; verbose=3)
	str = String(resp.body)
    a = JSON.Parser.parse(str)
	b=a["cases_time_series"]
	df=reduce(vcat, DataFrame.(b))
	df

end

# ╔═╡ efe42dd0-7f4d-11eb-2c3b-69322e9c3cfd
begin
	df[!,:dailyconfirmedint] = [parse(Int,x) for x in df[!,:dailyconfirmed]]
	df[!,:dailydeceasedint] = [parse(Int,x) for x in df[!,:dailydeceased]]
	df[!,:dailyrecoveredint] = [parse(Int,x) for x in df[!,:dailyrecovered]]
	df
end
	
	

# ╔═╡ 0f4f3c40-7f59-11eb-1b34-25d149185abd
begin
	a1=fill(1,2)
	a2=fill(2,29)
	a3=fill(3,31)
	a4=fill(4,30)
	a5=fill(5,31)
	a6=fill(6,30)
	a7=fill(7,31)
	a8=fill(8,31)
	a9=fill(9,30)
	a10=fill(10,31)
	a11=fill(11,30)
	a12=fill(12,31)
	a13=fill(13,31)
	a14=fill(14,28)
	a15=fill(15,6)
	
end

# ╔═╡ 21157290-7f5a-11eb-31c5-ebdd0dd321f1
begin
	df[!,:splitcriteria]=[a1;a2;a3;a4;a5;a6;a7;a8;a9;a10;a11;a12;a13;a14;a15]
	df
end

# ╔═╡ 56c67410-7f5b-11eb-28a8-19d537a9f221
gdf=groupby(df,:splitcriteria)

# ╔═╡ 121532b0-7f5c-11eb-0634-f547e19d1cea
combine(gdf,:dailyconfirmedint=> sum, :dailydeceasedint=> sum, :dailyrecoveredint=> sum)

# ╔═╡ a8f98e80-7f5f-11eb-349c-033c8b43d4a4
begin
	plot(df[!,:dailyconfirmedint],label="originalconfirmed")
end

# ╔═╡ 39326960-7f6d-11eb-335d-81f4f5b425e9
plot(df[!,:dailydeceasedint],label="originaldeceased")

# ╔═╡ 5caf3080-7f6d-11eb-2c8f-3dc75b1c620b
plot(df[!,:dailyrecoveredint],label="originalrecovered")

# ╔═╡ 29b67560-7f65-11eb-0359-8b5b6fdc4747
df1=select(df,:dailyconfirmedint,:dailydeceasedint, :dailyrecoveredint)

# ╔═╡ ea188af0-7f6a-11eb-3719-d3f2da8d2e4b
df1[!,:dailyconfirmedint]

# ╔═╡ 7f064b10-7f67-11eb-396a-b5b141cf75bb
begin
	movingc=zeros(402)
	for i in 7:402
		sum1=0
		for j in i-6:i
			sum1=sum1+df1[!,:dailyconfirmedint][j]
		end
		
		movingc[i]=sum1/7
	end
	
end
		
			

# ╔═╡ db942740-7f6b-11eb-3956-4bbd52b24058
begin
	df1[!,:movingconfirmed]=movingc
	df1
end

# ╔═╡ 1f70e520-7f6c-11eb-382b-e132eeeb702f
plot(df1[!,:movingconfirmed],label="movingconfirmed")

# ╔═╡ 462b7222-7f6c-11eb-0db4-efec3b74349a
begin
	movingd=zeros(402)
	for i in 7:402
		sum2=0
		for j in i-6:i
			sum2=sum2+df1[!,:dailydeceasedint][j]
		end
		
		movingd[i]=sum2/7
	end
	
end

# ╔═╡ 71b51360-7f6c-11eb-3cc9-e5550de09f5d
begin
	df1[!,:movingdeceased]=movingd
	df1
end

# ╔═╡ 94cf2110-7f6c-11eb-1d28-87de5a753b5c
plot(df1[!,:movingdeceased],label="movingdeceased")

# ╔═╡ c726b3d0-7f6c-11eb-0229-21a705752952
begin
	movingr=zeros(402)
	for i in 7:402
		sum3=0
		for j in i-6:i
			sum3=sum3+df1[!,:dailyrecoveredint][j]
		end
		
		movingr[i]=sum3/7
	end
	
end

# ╔═╡ ebe1c750-7f6c-11eb-02f4-27d0c0bf92a9
begin
	df1[!,:movingrecovered]=movingr
	df1
end

# ╔═╡ 1bd8adc2-7f6d-11eb-384b-7545c71cd5e1
plot(df1[!,:movingrecovered],label="movingrecovered")

# ╔═╡ Cell order:
# ╠═07061a40-7f4a-11eb-057a-c1e82802e46b
# ╠═c6dcf912-7f4a-11eb-2364-f362943ecc47
# ╠═d30723a0-7f4a-11eb-23bf-cb69061fcc6f
# ╠═da213950-7f4a-11eb-0dfa-cb603d195f2d
# ╠═0251c480-7f4b-11eb-25bc-8944d94def76
# ╠═efe42dd0-7f4d-11eb-2c3b-69322e9c3cfd
# ╠═0f4f3c40-7f59-11eb-1b34-25d149185abd
# ╠═21157290-7f5a-11eb-31c5-ebdd0dd321f1
# ╠═56c67410-7f5b-11eb-28a8-19d537a9f221
# ╠═121532b0-7f5c-11eb-0634-f547e19d1cea
# ╠═d26db2b0-7f5e-11eb-21a1-d1402292601b
# ╠═a8f98e80-7f5f-11eb-349c-033c8b43d4a4
# ╠═39326960-7f6d-11eb-335d-81f4f5b425e9
# ╠═5caf3080-7f6d-11eb-2c8f-3dc75b1c620b
# ╠═ed8c6b10-7f61-11eb-1b48-65b262cbd0de
# ╠═cdff30d0-7f65-11eb-0bec-07eda6f5acd0
# ╠═29b67560-7f65-11eb-0359-8b5b6fdc4747
# ╠═ea188af0-7f6a-11eb-3719-d3f2da8d2e4b
# ╠═7f064b10-7f67-11eb-396a-b5b141cf75bb
# ╠═db942740-7f6b-11eb-3956-4bbd52b24058
# ╠═1f70e520-7f6c-11eb-382b-e132eeeb702f
# ╠═462b7222-7f6c-11eb-0db4-efec3b74349a
# ╠═71b51360-7f6c-11eb-3cc9-e5550de09f5d
# ╠═94cf2110-7f6c-11eb-1d28-87de5a753b5c
# ╠═c726b3d0-7f6c-11eb-0229-21a705752952
# ╠═ebe1c750-7f6c-11eb-02f4-27d0c0bf92a9
# ╠═1bd8adc2-7f6d-11eb-384b-7545c71cd5e1
