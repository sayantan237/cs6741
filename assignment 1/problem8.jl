### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 0fa32a20-744c-11eb-0476-67b7dae0b4ff
begin
	using Plots
	pyplot()
end

# ╔═╡ 7717b130-744c-11eb-2ca8-43cc548bb124
using Distributions

# ╔═╡ 8986a012-744c-11eb-05c3-f17752190ad4
function conditionalprob(p)
	num=10000
	count=0
	count2=0
	for i in 1:num
		count1=0
		balance=10
		d=Bernoulli(1-p)
		x=rand(d,20)
		
		for j in 1:20
			if x[j]==0
				balance=balance-1
				if balance<=0
					count1=count1+1
				end
			else
				balance=balance+1

			end

		end
		if count1==0
			count2=count2+1
			if sum(x)>=10
				count=count+1
			end
		end
	end
	return count/count2
end

# ╔═╡ d5af1900-7450-11eb-17ce-57a571e9824e
function displayconditionalprob(n)
	return conditionalprob(n*1), conditionalprob(n*2), conditionalprob(n*3), conditionalprob(n*4), conditionalprob(n*5),conditionalprob(n*6), conditionalprob(n*7), conditionalprob(n*8), conditionalprob(n*9)
end

# ╔═╡ 22b87c10-7455-11eb-086e-03dae281cb80
displayconditionalprob(0.1)

# ╔═╡ 984e3b60-7458-11eb-3733-fd93bef64753
plot(conditionalprob,0.1,0.9)

# ╔═╡ Cell order:
# ╠═0fa32a20-744c-11eb-0476-67b7dae0b4ff
# ╠═7717b130-744c-11eb-2ca8-43cc548bb124
# ╠═8986a012-744c-11eb-05c3-f17752190ad4
# ╠═d5af1900-7450-11eb-17ce-57a571e9824e
# ╠═22b87c10-7455-11eb-086e-03dae281cb80
# ╠═984e3b60-7458-11eb-3733-fd93bef64753
