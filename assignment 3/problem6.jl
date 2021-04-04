### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ fc83c432-94fe-11eb-1734-efbbc24213ec
begin
	using Plots
	pyplot()
end

# ╔═╡ baade090-9503-11eb-08f4-d5d3a61310e5
begin
	using PlutoUI
	using StatsPlots
	using StatsBase
	using Distributions
	using LaTeXStrings
	using QuadGK
end

# ╔═╡ 0cb57b00-9504-11eb-0a0d-a5ff022d110a
begin
	using DataFrames
	using CSV
	using Statistics
	using Random
	using Missings
	using HTTP
	using JSON
	using Dates
end

# ╔═╡ da4cefee-9511-11eb-11b1-eb8823da5bb7
using TimeSeries

# ╔═╡ 5025a220-9509-11eb-23f6-9906908988c3
r=HTTP.get("https://api.covid19india.org/csv/latest/states.csv")

# ╔═╡ 94477f50-9509-11eb-3b28-3180eb965d55
df = DataFrame(CSV.File(r.body))

# ╔═╡ aa871580-951a-11eb-31bc-07da825ddbf3
df1=df[df.State.!="India",:]

# ╔═╡ 6045eea0-9520-11eb-1d96-3deaab873f32
df2 = transform(df1, :, :Date => ByRow(x -> string(Dates.week(Date(x)), " ", Dates.year(Date(x)))) => :week)

# ╔═╡ e897de00-9519-11eb-2b53-c50b278eaf55
df3=select(df2,:week,:State,:Confirmed)

# ╔═╡ 7544e1c0-9521-11eb-2b8b-694648536ae4
gdf1=groupby(df3,:State)

# ╔═╡ 5c195490-9523-11eb-1f40-ed02a6f26115
gdf1[1]

# ╔═╡ 69e45de0-9523-11eb-27be-11ffdf52d3fd
gdf2=groupby(gdf1[1],:week)


# ╔═╡ 6114b910-955c-11eb-24c8-a3a5deab6179
df4=combine(gdf2,:Confirmed=>sum)

# ╔═╡ Cell order:
# ╠═fc83c432-94fe-11eb-1734-efbbc24213ec
# ╠═baade090-9503-11eb-08f4-d5d3a61310e5
# ╠═0cb57b00-9504-11eb-0a0d-a5ff022d110a
# ╠═da4cefee-9511-11eb-11b1-eb8823da5bb7
# ╠═5025a220-9509-11eb-23f6-9906908988c3
# ╠═94477f50-9509-11eb-3b28-3180eb965d55
# ╠═aa871580-951a-11eb-31bc-07da825ddbf3
# ╠═6045eea0-9520-11eb-1d96-3deaab873f32
# ╠═e897de00-9519-11eb-2b53-c50b278eaf55
# ╠═7544e1c0-9521-11eb-2b8b-694648536ae4
# ╠═5c195490-9523-11eb-1f40-ed02a6f26115
# ╠═69e45de0-9523-11eb-27be-11ffdf52d3fd
# ╠═6114b910-955c-11eb-24c8-a3a5deab6179
