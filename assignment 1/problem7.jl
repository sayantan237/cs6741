### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ d9f57a6e-743e-11eb-0457-d96846beedfa
begin
	using Plots
	pyplot()
end

# ╔═╡ 5dd15160-7440-11eb-0377-d9aa157a6f14
using Distributions

# ╔═╡ 6c5ff8d0-7440-11eb-13e3-8b90faad8c88
function goingbankrupt(p)
	num=100000
	count=0
	
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
		if count1>=1
			count=count+1
		end
	end
	return count/num
end

# ╔═╡ a20f0910-7442-11eb-343c-f153ea978db9
function displaygoingbankrupt(n)
	return goingbankrupt(n*0),goingbankrupt(n*1),goingbankrupt(n*2),goingbankrupt(n*3),goingbankrupt(n*4),goingbankrupt(n*5),goingbankrupt(n*6),goingbankrupt(n*7),goingbankrupt(n*8),goingbankrupt(n*9),goingbankrupt(n*10)
end

# ╔═╡ 13e78000-744b-11eb-3db6-433f35745b44
displaygoingbankrupt(0.1)

# ╔═╡ 9adb88e0-744b-11eb-1ea9-87925037cb46
plot(goingbankrupt,0,1)

# ╔═╡ Cell order:
# ╠═d9f57a6e-743e-11eb-0457-d96846beedfa
# ╠═5dd15160-7440-11eb-0377-d9aa157a6f14
# ╠═6c5ff8d0-7440-11eb-13e3-8b90faad8c88
# ╠═a20f0910-7442-11eb-343c-f153ea978db9
# ╠═13e78000-744b-11eb-3db6-433f35745b44
# ╠═9adb88e0-744b-11eb-1ea9-87925037cb46
