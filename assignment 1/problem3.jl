### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 49ddf790-739f-11eb-2aa4-d1e78bb53170
begin
	using Plots
	pyplot()
end

# ╔═╡ 37d70dc2-73a9-11eb-3e2b-6d6dc3c0aa17
using Distributions

# ╔═╡ 44a89be0-73a9-11eb-05df-ada355097d01
cards=["Jack", "Jack", "Jack", "Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack"]

# ╔═╡ 53664290-73a9-11eb-2799-3f40cfb5e60d
function withreplacement(n)
	num=10000
	count=0
	for i in 1:num
		count1=0
		for j in 1:5
			if rand(cards)=="Jack"
				count1=count1+1
			end
		end
		if count1==n
			count=count+1
		end
	end
	return count/num
end

# ╔═╡ 6b5238f0-73a9-11eb-18f4-df6c03fdd925
D_b=Binomial(5,1/13)

# ╔═╡ a1792330-73a9-11eb-39cc-bd0007518a42
function error(x)
	error1= abs(withreplacement(x)-pdf(D_b,x))
	return error1
end

# ╔═╡ fb9da7e0-73aa-11eb-1f5f-d9590662f085
error(2)

# ╔═╡ 08e4b41e-73ab-11eb-0eec-ab9fcce0b9cf
plot(0:4,error)

# ╔═╡ 4ee27d40-73ab-11eb-0951-952f6e34aa4f
function withoutreplacement(n)
	num=10000
	count=0
	for i = 1:num
		count1=0
		cards1=copy(cards)
		for j = 1:5
		    card=rand(cards1)
			if card=="Jack"
				count1=count1+1
			end
			deleteat!(cards1, findfirst(x-> x == card, cards1))
		end
		if count1==n
			count=count+1
		end
	end
	
	return(count/num)
	
end

# ╔═╡ 713a7370-73ab-11eb-0933-87647c290085
D_h=Hypergeometric(4,48,5)

# ╔═╡ 55f91a10-73b7-11eb-30cf-2f27839b173b
pdf(D_h,2)

# ╔═╡ ae2547a0-73ac-11eb-1534-e7a0d1a22f3e
function error2(x)
	error3= abs(withoutreplacement(x)-pdf(D_h,x))
	return error3
end

# ╔═╡ 50fcdb50-73b7-11eb-3039-21ff0c338fbc
plot(0:4,error2)

# ╔═╡ Cell order:
# ╠═49ddf790-739f-11eb-2aa4-d1e78bb53170
# ╠═37d70dc2-73a9-11eb-3e2b-6d6dc3c0aa17
# ╠═44a89be0-73a9-11eb-05df-ada355097d01
# ╠═53664290-73a9-11eb-2799-3f40cfb5e60d
# ╠═6b5238f0-73a9-11eb-18f4-df6c03fdd925
# ╠═a1792330-73a9-11eb-39cc-bd0007518a42
# ╠═fb9da7e0-73aa-11eb-1f5f-d9590662f085
# ╠═08e4b41e-73ab-11eb-0eec-ab9fcce0b9cf
# ╠═4ee27d40-73ab-11eb-0951-952f6e34aa4f
# ╠═713a7370-73ab-11eb-0933-87647c290085
# ╠═55f91a10-73b7-11eb-30cf-2f27839b173b
# ╠═ae2547a0-73ac-11eb-1534-e7a0d1a22f3e
# ╠═50fcdb50-73b7-11eb-3039-21ff0c338fbc
