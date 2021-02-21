### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ ff2d0930-73f7-11eb-0f0b-bf6b9f740a9e
begin
	using Plots
	pyplot()
end

# ╔═╡ de28bb20-7402-11eb-2134-e5dacbcf0ad5
using Distributions

# ╔═╡ ebb90560-7402-11eb-34e1-5df2c357d7a3
function computeprob(p)
	num=100000
	count=0
	for i in 1:num
		d=Bernoulli(1-p)
		x=rand(d,20)
		if sum(x)>=10
			count=count+1
		end
	end
	return count/num
end
	

# ╔═╡ 8f19d400-7412-11eb-1972-091437cd62ae
function displaycomputeprob(n)
	return computeprob(n*0), computeprob(n*1),computeprob(n*2),computeprob(n*3),computeprob(n*4),computeprob(n*5),computeprob(n*6),computeprob(n*7),computeprob(n*8),computeprob(n*9),computeprob(n*10)

end

# ╔═╡ 0ddeadb0-7413-11eb-3232-b94093f0955c
displaycomputeprob(0.1)

# ╔═╡ 46b224e0-7414-11eb-2c8e-71c6da7e2a58
plot(computeprob, 0,1)

# ╔═╡ b4c23b70-7417-11eb-150f-2565d6032d25
function computeprob1(p)
	return sum([binomial(20,i)*((1-p)^i)*(p^(20-i)) for i in 10:20])
end

# ╔═╡ 4d6648a0-741b-11eb-2b57-8ba9ac25b56b
function displaycomputeprob1(n)
	return computeprob1(n*0), computeprob1(n*1),computeprob1(n*2),computeprob1(n*3),computeprob1(n*4),computeprob1(n*5),computeprob1(n*6),computeprob1(n*7),computeprob1(n*8),computeprob1(n*9),computeprob1(n*10)

end

# ╔═╡ 6ef6f730-741b-11eb-2ac3-4369d8105fe6
displaycomputeprob1(0.1)

# ╔═╡ fc0ad740-741b-11eb-1be2-bdcc4ab2c499
function abserror(p)
	return abs(computeprob(p)-computeprob1(p))
end

# ╔═╡ 2116f0f0-741c-11eb-0d69-e56179d3bc7e
plot(abserror,0,1)

# ╔═╡ Cell order:
# ╠═ff2d0930-73f7-11eb-0f0b-bf6b9f740a9e
# ╠═de28bb20-7402-11eb-2134-e5dacbcf0ad5
# ╠═ebb90560-7402-11eb-34e1-5df2c357d7a3
# ╠═8f19d400-7412-11eb-1972-091437cd62ae
# ╠═0ddeadb0-7413-11eb-3232-b94093f0955c
# ╠═46b224e0-7414-11eb-2c8e-71c6da7e2a58
# ╠═b4c23b70-7417-11eb-150f-2565d6032d25
# ╠═4d6648a0-741b-11eb-2b57-8ba9ac25b56b
# ╠═6ef6f730-741b-11eb-2ac3-4369d8105fe6
# ╠═fc0ad740-741b-11eb-1be2-bdcc4ab2c499
# ╠═2116f0f0-741c-11eb-0d69-e56179d3bc7e
