### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ e802ac00-7371-11eb-1bd0-9ddef316c2c8
begin
	using Plots
	pyplot()
end

# ╔═╡ 4871effe-7395-11eb-360a-cd5e1cb7c714
using Random

# ╔═╡ 7dbc6650-737c-11eb-23e8-0f04fbbb0e3c
cards=["Jack", "Jack", "Jack", "Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack", "Non-Jack"] 


# ╔═╡ 00502580-7381-11eb-1ce0-29b866a510fe
rand(cards)
	

# ╔═╡ 2216bbb0-7382-11eb-1848-3d96da15ba4f
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

# ╔═╡ e7b15b10-739a-11eb-1d03-4503490e79a3
withreplacement(1)

# ╔═╡ 26a477d0-739b-11eb-2208-2f461816e358
withreplacement(2)

# ╔═╡ 3a0fc812-739b-11eb-3579-57427914d0fc
withreplacement(3)

# ╔═╡ 43ffe120-739b-11eb-15a1-c39833c8a9ad
withreplacement(4)

# ╔═╡ 4c89b370-739b-11eb-256c-33354d4d2a0b
withreplacement(0)

# ╔═╡ 59a5df1e-739b-11eb-097b-3d4c3566260b
plot(withreplacement,0,4)

# ╔═╡ fa914720-738d-11eb-1e26-efc293b6a711
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

# ╔═╡ 854f6bd0-7398-11eb-1933-f9019e564cd8
withoutreplacement(0)

# ╔═╡ 81496c90-739b-11eb-3d31-7b2f7606e69f
withoutreplacement(1)

# ╔═╡ 8addaa00-739b-11eb-07a4-ef16447ef657
withoutreplacement(2)

# ╔═╡ 96460b30-739b-11eb-2d68-753f6d1d93a4
withoutreplacement(3)

# ╔═╡ 9f9aa790-739b-11eb-35a4-d5a33738a45d
withoutreplacement(4)

# ╔═╡ abd01cc0-739b-11eb-20c3-094dab133539
plot(withoutreplacement,0,4)

# ╔═╡ Cell order:
# ╠═e802ac00-7371-11eb-1bd0-9ddef316c2c8
# ╠═4871effe-7395-11eb-360a-cd5e1cb7c714
# ╠═7dbc6650-737c-11eb-23e8-0f04fbbb0e3c
# ╠═00502580-7381-11eb-1ce0-29b866a510fe
# ╠═2216bbb0-7382-11eb-1848-3d96da15ba4f
# ╠═e7b15b10-739a-11eb-1d03-4503490e79a3
# ╠═26a477d0-739b-11eb-2208-2f461816e358
# ╠═3a0fc812-739b-11eb-3579-57427914d0fc
# ╠═43ffe120-739b-11eb-15a1-c39833c8a9ad
# ╠═4c89b370-739b-11eb-256c-33354d4d2a0b
# ╠═59a5df1e-739b-11eb-097b-3d4c3566260b
# ╠═fa914720-738d-11eb-1e26-efc293b6a711
# ╠═854f6bd0-7398-11eb-1933-f9019e564cd8
# ╠═81496c90-739b-11eb-3d31-7b2f7606e69f
# ╠═8addaa00-739b-11eb-07a4-ef16447ef657
# ╠═96460b30-739b-11eb-2d68-753f6d1d93a4
# ╠═9f9aa790-739b-11eb-35a4-d5a33738a45d
# ╠═abd01cc0-739b-11eb-20c3-094dab133539
