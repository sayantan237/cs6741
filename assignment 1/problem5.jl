### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ d1df18b0-7465-11eb-1829-f3a25ce62ab5
characters=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","`","~","!","@","#","\$","%","^","&","*","(",")","_","-","+","="]

# ╔═╡ 3603ff90-7466-11eb-09fd-ffefe3543143
function newrule(n)
	num=1000000
	count=0
	actualpassword="Sayantan"
	for i in 1:num
		count1=0
		for j=1:8
			if rand(characters)==actualpassword[j:j]
				count1=count1+1
			end
		end
		if count1>=n
			count=count+1
		end
	end
	count
end
		

# ╔═╡ 1913e5c0-7467-11eb-04f8-636b3a09763f
newrule(2)

# ╔═╡ 276dc18e-7467-11eb-14b9-af9a6f30ddf5
newrule(3)

# ╔═╡ 3027cba0-7467-11eb-1490-41b71fec9fe5
newrule(4)

# ╔═╡ Cell order:
# ╠═d1df18b0-7465-11eb-1829-f3a25ce62ab5
# ╠═3603ff90-7466-11eb-09fd-ffefe3543143
# ╠═1913e5c0-7467-11eb-04f8-636b3a09763f
# ╠═276dc18e-7467-11eb-14b9-af9a6f30ddf5
# ╠═3027cba0-7467-11eb-1490-41b71fec9fe5
