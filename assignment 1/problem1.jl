### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 43f4a942-7369-11eb-0c2a-9342eb62c4fa
begin
	using Plots
	pyplot()
end

# ╔═╡ 3083701e-736a-11eb-1121-5f29d5c8e486
using Random

# ╔═╡ cffca220-736a-11eb-3235-1bdfb4b3f66f
using Distributions

# ╔═╡ 4cb5c2be-736a-11eb-1cfc-dfa2abc9890d
function randomnumbersum(N)
	Random.seed!(0)
	numbers=[]
	for i in 1:N
		push!(numbers,rand(-100:100))
	end
	return(sum(numbers)/N)
end
		

# ╔═╡ 1975d660-736b-11eb-0ddb-c1c51060da1b
randomnumbersum(110000)

# ╔═╡ 29ce8f70-736b-11eb-2270-f1e64c11d2e3
plot(randomnumbersum,1,1000)

# ╔═╡ 2d329aa0-736e-11eb-1f82-916ef968ddfc
function randomnumbersum1(N)
	Random.seed!(0)
	result=0
	for i in 1:N
		result=result+rand(Normal(0,1))
	end
	return result/N
end

# ╔═╡ 77a17980-736e-11eb-134a-b702650e9b39
plot(randomnumbersum1,1,1000)

# ╔═╡ Cell order:
# ╠═43f4a942-7369-11eb-0c2a-9342eb62c4fa
# ╠═3083701e-736a-11eb-1121-5f29d5c8e486
# ╠═cffca220-736a-11eb-3235-1bdfb4b3f66f
# ╠═4cb5c2be-736a-11eb-1cfc-dfa2abc9890d
# ╠═1975d660-736b-11eb-0ddb-c1c51060da1b
# ╠═29ce8f70-736b-11eb-2270-f1e64c11d2e3
# ╠═2d329aa0-736e-11eb-1f82-916ef968ddfc
# ╠═77a17980-736e-11eb-134a-b702650e9b39
