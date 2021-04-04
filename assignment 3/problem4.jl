### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 35255830-944b-11eb-253e-5d0c12169ee8
begin
	using Plots
	plotly()
end

# ╔═╡ 2d881582-945b-11eb-18e8-f35b6b1395c3
begin
	using PlutoUI
	using StatsPlots
	using StatsBase
	using Distributions
	using LaTeXStrings
	using QuadGK
end

# ╔═╡ 3fc73440-947b-11eb-285b-59494155844a
using Random

# ╔═╡ c71fa440-947b-11eb-36b8-3febc3f5ae6c
range_(x)=maximum(x)-minimum(x)

# ╔═╡ 162b75c2-947a-11eb-3b63-f1f3cd48e275
begin
	Random.seed!(100)
	random_arr=[[rand(Uniform(0,1)) for _ in 1:30] for _ in 1:10000]
	
end

# ╔═╡ 48692d00-947c-11eb-01b9-db2f19db82a3
random_range=[range_(random_arr[i]) for i in 1:10000]

# ╔═╡ 598073c0-947f-11eb-28e4-2b551700ec8e
begin
	histogram(random_range)
    scatter!([mean(random_range)],[500])
	scatter!([mode(random_range)],[500])
	scatter!([median(random_range)],[500])
end

# ╔═╡ c5576000-947e-11eb-2c52-f50808c9f9d6
mean(random_range)

# ╔═╡ 219173b0-947f-11eb-02da-7faf26724f97
mode(random_range)

# ╔═╡ 742b14f0-947f-11eb-0b21-c13fb2aafff0
median(random_range)

# ╔═╡ 654a0c20-949d-11eb-3c50-c7149b5bfeef
center_point=mean(random_range)

# ╔═╡ 8762fd7e-949d-11eb-3317-53141cc605c1
begin
	left_arr = filter(x->x<center_point, random_range)
	right_arr = filter(x->x>=center_point, random_range)
end

# ╔═╡ 1ef41b70-949e-11eb-0d75-0de7cda270ed
begin
	histogram(left_arr)
	histogram!(right_arr)
end

# ╔═╡ 6446e212-949f-11eb-08e9-b96903afb8b2
begin
	left_arr1 = filter(x->x<median(random_range), random_range)
	right_arr1 = filter(x->x>=median(random_range), random_range)
end

# ╔═╡ c5243f10-949f-11eb-2cdb-37cfdfd8137d
begin
	histogram(left_arr1)
	histogram!(right_arr1)
end

# ╔═╡ 5e668f6e-94a0-11eb-2384-abdd7b62edd5
begin
	left_arr2 = filter(x->x<mode(random_range), random_range)
	right_arr2 = filter(x->x>=mode(random_range), random_range)
end

# ╔═╡ 7b069800-94a0-11eb-1927-81c79a5d4551
begin
	histogram(left_arr2)
	histogram!(right_arr2)
end

# ╔═╡ Cell order:
# ╠═35255830-944b-11eb-253e-5d0c12169ee8
# ╠═2d881582-945b-11eb-18e8-f35b6b1395c3
# ╠═3fc73440-947b-11eb-285b-59494155844a
# ╠═c71fa440-947b-11eb-36b8-3febc3f5ae6c
# ╠═162b75c2-947a-11eb-3b63-f1f3cd48e275
# ╠═48692d00-947c-11eb-01b9-db2f19db82a3
# ╠═598073c0-947f-11eb-28e4-2b551700ec8e
# ╠═c5576000-947e-11eb-2c52-f50808c9f9d6
# ╠═219173b0-947f-11eb-02da-7faf26724f97
# ╠═742b14f0-947f-11eb-0b21-c13fb2aafff0
# ╠═654a0c20-949d-11eb-3c50-c7149b5bfeef
# ╠═8762fd7e-949d-11eb-3317-53141cc605c1
# ╠═1ef41b70-949e-11eb-0d75-0de7cda270ed
# ╠═6446e212-949f-11eb-08e9-b96903afb8b2
# ╠═c5243f10-949f-11eb-2cdb-37cfdfd8137d
# ╠═5e668f6e-94a0-11eb-2384-abdd7b62edd5
# ╠═7b069800-94a0-11eb-1927-81c79a5d4551
