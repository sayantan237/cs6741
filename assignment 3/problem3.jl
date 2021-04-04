### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 0264ec82-9482-11eb-0f86-47aa5fa8ca90
begin
	using Plots
	plotly()
end

# ╔═╡ 700ad6f0-9482-11eb-0ea6-b17d89a200cc
begin
	using PlutoUI
	using StatsPlots
	using StatsBase
	using Distributions
	using LaTeXStrings
	using QuadGK
	using Random
end

# ╔═╡ 7b7da620-9487-11eb-047e-cb8aa8e44ffa
using FreqTables

# ╔═╡ e7fddc9e-9484-11eb-00a9-55a3a0c18875
array1=fill(1.0,495)

# ╔═╡ c987f0b0-9486-11eb-2386-83873445674a
array2=fill(2.0,502)

# ╔═╡ d8dd6a8e-9486-11eb-2f6b-bb70feed697e
array3=vcat(array1,array2)

# ╔═╡ e58c7c92-9486-11eb-0ee4-6b54d8b30157
array4=vcat(array3,fill(3.0,37))

# ╔═╡ ea672cc0-948a-11eb-0bd1-cd534f35834b
array5=vcat(array4,fill(4.0,22))

# ╔═╡ ba4684f0-948f-11eb-0583-83630242e6b1
array6=vcat(array5,fill(5.0,10))

# ╔═╡ cb48c470-948f-11eb-2843-d33376abc619
begin
	bar(freqtable(array6),label="synthetic data")
	scatter!([mean(array6)],[503],label="mean")
	scatter!([median(array6)],[503],label="median")
	scatter!([mode(array6)],[510],label="mode")
end	

# ╔═╡ 0dd6e240-9490-11eb-28d4-051ce1e77281
mean(array6)

# ╔═╡ 188df4d0-9490-11eb-30a4-ed1a6148dda3
mode(array6)

# ╔═╡ 2042eaf0-9490-11eb-2695-ed67ee68e565
median(array6)

# ╔═╡ 3f53f37e-9490-11eb-15d2-e74dd340d7c0
begin
	Random.seed!(123)
	array7=array6+rand(Normal(1,0.025),1066)
end

# ╔═╡ b744c12e-9490-11eb-21ac-d9ea3092b1e9
begin
	density(array7,label="continuous synthetic data")
	scatter!([mean(array7)],[1.14],label="mean")
	scatter!([median(array7)],[1.14],label="median")
	

end

# ╔═╡ 5be44f30-9491-11eb-351d-735c8da63cb9
mean(array7)

# ╔═╡ 6231c610-9491-11eb-2afc-69721e72436a
median(array7)

# ╔═╡ Cell order:
# ╠═0264ec82-9482-11eb-0f86-47aa5fa8ca90
# ╠═700ad6f0-9482-11eb-0ea6-b17d89a200cc
# ╠═7b7da620-9487-11eb-047e-cb8aa8e44ffa
# ╠═e7fddc9e-9484-11eb-00a9-55a3a0c18875
# ╠═c987f0b0-9486-11eb-2386-83873445674a
# ╠═d8dd6a8e-9486-11eb-2f6b-bb70feed697e
# ╠═e58c7c92-9486-11eb-0ee4-6b54d8b30157
# ╠═ea672cc0-948a-11eb-0bd1-cd534f35834b
# ╠═ba4684f0-948f-11eb-0583-83630242e6b1
# ╠═cb48c470-948f-11eb-2843-d33376abc619
# ╠═0dd6e240-9490-11eb-28d4-051ce1e77281
# ╠═188df4d0-9490-11eb-30a4-ed1a6148dda3
# ╠═2042eaf0-9490-11eb-2695-ed67ee68e565
# ╠═3f53f37e-9490-11eb-15d2-e74dd340d7c0
# ╠═b744c12e-9490-11eb-21ac-d9ea3092b1e9
# ╠═5be44f30-9491-11eb-351d-735c8da63cb9
# ╠═6231c610-9491-11eb-2afc-69721e72436a
