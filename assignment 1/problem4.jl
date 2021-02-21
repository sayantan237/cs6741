### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 1e135440-7424-11eb-05c2-7300fd0b671f
characters=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","`","~","!","@","#","\$","%","^","&","*","(",")","_","-","+","="]

# ╔═╡ 4a6bf35e-7426-11eb-37e2-3956d1200f46
rand(characters)

# ╔═╡ 54ad39b0-7426-11eb-2ee7-6fe312e34fbc
begin
	num=100000
	count=0
	actualpassword="Sayantan"
	for i=1:num
		count1=0
		for j=1:8
			if rand(characters)==actualpassword[j:j]
				count1=count1+1
			end
		end
		if count1>=2
			count=count+1
		end
	end
	count/num
end

# ╔═╡ Cell order:
# ╠═1e135440-7424-11eb-05c2-7300fd0b671f
# ╠═4a6bf35e-7426-11eb-37e2-3956d1200f46
# ╠═54ad39b0-7426-11eb-2ee7-6fe312e34fbc
