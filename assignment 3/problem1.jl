### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 4036cf80-943a-11eb-30f6-9f57c249bfd8
begin
	using Plots
	plotly()
end

# ╔═╡ 2874a0de-943d-11eb-2ca9-fb15b7da6c16
begin
	using PlutoUI
	using StatsPlots
	using StatsBase
	using Distributions
	using LaTeXStrings
	using QuadGK
end

# ╔═╡ e5685cf0-943d-11eb-02d4-676090490969
function KL(density1, density2)
	return quadgk(x->pdf(density1,x)*log(pdf(density1,x)/pdf(density2,x)),(-37,37)...)[1]
end

# ╔═╡ 20f467a0-9443-11eb-1b32-8bdb13062184
KL(TDist(1),Normal(0,1))

# ╔═╡ 606f6720-9445-11eb-05b2-e5c4f227644b
KL(TDist(2),Normal(0,1))

# ╔═╡ 6090b550-9446-11eb-0107-130af496e2fa
KL(TDist(3),Normal(0,1))

# ╔═╡ 669aba90-9446-11eb-0593-3fa498e39588
KL(TDist(4),Normal(0,1))

# ╔═╡ 6c866260-9446-11eb-39ad-95f1f9aa86f7
KL(TDist(5),Normal(0,1))

# ╔═╡ Cell order:
# ╠═4036cf80-943a-11eb-30f6-9f57c249bfd8
# ╠═2874a0de-943d-11eb-2ca9-fb15b7da6c16
# ╠═e5685cf0-943d-11eb-02d4-676090490969
# ╠═20f467a0-9443-11eb-1b32-8bdb13062184
# ╠═606f6720-9445-11eb-05b2-e5c4f227644b
# ╠═6090b550-9446-11eb-0107-130af496e2fa
# ╠═669aba90-9446-11eb-0593-3fa498e39588
# ╠═6c866260-9446-11eb-39ad-95f1f9aa86f7
