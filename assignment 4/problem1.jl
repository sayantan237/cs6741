### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ e90678f2-b4c3-11eb-1cde-f3eee0d7d0d4
using Distributions


# ╔═╡ aa3eda30-b4dd-11eb-215a-3b7d561e6580
using Random

# ╔═╡ 59c43ca0-b4c2-11eb-2165-5dfb0b5ebed1
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
		

# ╔═╡ 527fd0b0-b4c4-11eb-0d87-732780d98fc3
computeprob(0.5)

# ╔═╡ 4e43a970-b4cb-11eb-380a-77dca9ce03cc
function computeprob1(p)
	return sum([binomial(50,k)*(p^k)*((1-p)^(50-k)) for k in 30:50])
end

# ╔═╡ ebf1b860-b4cb-11eb-16d5-e3d5aef6cf4c
computeprob1(0.5)

# ╔═╡ Cell order:
# ╠═e90678f2-b4c3-11eb-1cde-f3eee0d7d0d4
# ╠═aa3eda30-b4dd-11eb-215a-3b7d561e6580
# ╠═59c43ca0-b4c2-11eb-2165-5dfb0b5ebed1
# ╠═527fd0b0-b4c4-11eb-0d87-732780d98fc3
# ╠═4e43a970-b4cb-11eb-380a-77dca9ce03cc
# ╠═ebf1b860-b4cb-11eb-16d5-e3d5aef6cf4c
