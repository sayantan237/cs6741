### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ c3135bd0-b4dd-11eb-0cc4-af9f05b69ddb
begin
	using Distributions
	using Random
end

# ╔═╡ 5f679952-b59d-11eb-34c1-775692ef3cae
using Statistics

# ╔═╡ 65e93f90-b59d-11eb-1d3b-2dbcd258521e
z=(29.5-50*0.59)-(quantile(Normal(0,1),0.5))

# ╔═╡ d5d63710-b4dd-11eb-1779-914f1a2d245e
function computeprob(p)
	Random.seed!(1)
	num=100000
	count=0
	for i in 1:num
		d=Bernoulli(p)
		x=rand(d,50)
		if sum(x)>=30
			count=count+1
		end
	end
	return count/num
end

# ╔═╡ e4e46ec0-b4dd-11eb-02df-7de71ddfc75c
computeprob(0.59)

# ╔═╡ f0ef9fa0-b4dd-11eb-1f68-ad95964821e4
function computeprob1(p)
	return sum([binomial(50,k)*(p^k)*((1-p)^(50-k)) for k in 30:50])
end

# ╔═╡ 03ae8340-b4de-11eb-2ae4-9f9d95214baf
computeprob1(0.59)

# ╔═╡ Cell order:
# ╠═c3135bd0-b4dd-11eb-0cc4-af9f05b69ddb
# ╠═5f679952-b59d-11eb-34c1-775692ef3cae
# ╠═65e93f90-b59d-11eb-1d3b-2dbcd258521e
# ╠═d5d63710-b4dd-11eb-1779-914f1a2d245e
# ╠═e4e46ec0-b4dd-11eb-02df-7de71ddfc75c
# ╠═f0ef9fa0-b4dd-11eb-1f68-ad95964821e4
# ╠═03ae8340-b4de-11eb-2ae4-9f9d95214baf
