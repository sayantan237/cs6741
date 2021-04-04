### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 311a93d0-9497-11eb-1be7-01ce431f58d6
begin
	using Plots
	plotly()
end

# ╔═╡ 54763e60-9497-11eb-287c-0ffc5cf9e9fb
begin
	using PlutoUI
	using StatsPlots
	using StatsBase
	using Distributions
	using LaTeXStrings
	using QuadGK
	using Random
end

# ╔═╡ 6854e9e2-9497-11eb-07a8-2f7a681e95bd
using Statistics

# ╔═╡ 91198c30-94ee-11eb-355c-71cf909933b2
function OneSidedTailNormal(x,mu,sigma)
	z = quantile(Normal(0,1),(100-x)/100)
	return mu+z*sigma
end

# ╔═╡ 834b8ac0-94f0-11eb-32ab-4539dc2a8983
OneSidedTailNormal(5,0,1)

# ╔═╡ d8d4ae00-94f4-11eb-1b3d-715b46106592
OneSidedTailNormal(95,0,1)

# ╔═╡ 72763230-94f1-11eb-0419-bf239730e0d5
function OneSidedTailTDist(x,df)
	return quantile(TDist(df),(100-x)/100)
end	

# ╔═╡ 6162bf30-94f2-11eb-35a7-9bbf279c016f
OneSidedTailTDist(5,10)

# ╔═╡ 5f20f010-94f3-11eb-0fda-fb3b485f7308
OneSidedTailTDist(95,10)

# ╔═╡ 0b76cc60-94f7-11eb-35a4-e71684ce1ea5
begin
	plot(-5:0.1:5,[pdf(Normal(0,1),x) for x in -5:0.1:5],label="Normal Distribution")
	plot!([OneSidedTailNormal(95,0,1), OneSidedTailNormal(95,0,1)], [0, pdf(Normal(0,1), OneSidedTailNormal(95,0,1))], label="Area under the curve="*string(quadgk(x->pdf(Normal(0,1),x),(-5,OneSidedTailNormal(95,0,1))...)[1]), line=(4, :dash, :green))

end

# ╔═╡ 978ab9e0-94fd-11eb-0e26-195eb7fad462
begin
	plot(-5:0.1:5,[pdf(TDist(10),x) for x in -5:0.1:5],label="Student's T Distribution")
	plot!([OneSidedTailTDist(95,10), OneSidedTailTDist(95,10)], [0, pdf(TDist(10), OneSidedTailTDist(95,10))], label="Area under the curve="*string(quadgk(x->pdf(TDist(10),x),(-5,OneSidedTailTDist(95,10))...)[1]), line=(4, :dash, :green))

end

# ╔═╡ Cell order:
# ╠═311a93d0-9497-11eb-1be7-01ce431f58d6
# ╠═54763e60-9497-11eb-287c-0ffc5cf9e9fb
# ╠═6854e9e2-9497-11eb-07a8-2f7a681e95bd
# ╠═91198c30-94ee-11eb-355c-71cf909933b2
# ╠═834b8ac0-94f0-11eb-32ab-4539dc2a8983
# ╠═d8d4ae00-94f4-11eb-1b3d-715b46106592
# ╠═72763230-94f1-11eb-0419-bf239730e0d5
# ╠═6162bf30-94f2-11eb-35a7-9bbf279c016f
# ╠═5f20f010-94f3-11eb-0fda-fb3b485f7308
# ╠═0b76cc60-94f7-11eb-35a4-e71684ce1ea5
# ╠═978ab9e0-94fd-11eb-0e26-195eb7fad462
