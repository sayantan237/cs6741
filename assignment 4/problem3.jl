### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ a466ba50-b5a1-11eb-1a7e-91ea7ab8e4d8
begin
	using Distributions
	using Random
	using Statistics
end

# ╔═╡ 5906b020-b60e-11eb-006c-7b729fc391e0
begin
	using Plots
	pyplot()
end

# ╔═╡ bd0ab610-b5a1-11eb-2fd9-d35eac588c1f
quantile(Normal(0,1),0.05)-((2999.5-100*33)/(30*sqrt(33)))

# ╔═╡ cc116e10-b62d-11eb-361f-893b1c7c20f3
function computesuit(p)
	global k=1
	while 1-cdf(Normal(100*k,30*sqrt(k)),2999.5) <=p
		k=k+1
	end
	return k
end

# ╔═╡ ce6681a0-b62d-11eb-2d50-97ab249f27d1
computesuit(0.95)

# ╔═╡ c700ca80-b60d-11eb-2200-7d78f1aaaaa4
D_n1=Normal(100*33,30*sqrt(33))

# ╔═╡ e8b79eb0-b60d-11eb-2811-019e5252c560
1-cdf(D_n1,2999.5)

# ╔═╡ 1b9689e0-b60e-11eb-0ba3-bbf5018891ca
D_n2=Normal(100*32,30*sqrt(32))

# ╔═╡ 40b2a920-b60e-11eb-3cfc-87c54f0b2bfb
1-cdf(D_n2,2999.5)

# ╔═╡ 4f5b7d60-b610-11eb-1e6e-7b119b5fd219
plot(0:10:4000,[pdf(D_n1,x) for x in 0:10:4000],label="PDF")

# ╔═╡ 56897b1e-b60e-11eb-1404-2306e47ba769
begin
	plot(2500:1:4000,[cdf(D_n1,x) for x in 2500:1:4000],label="CDF for n=33")
    plot!(2500:1:4000,[cdf(D_n2,x) for x in 2500:1:4000],label="CDF for n=32")
	scatter!([2999.5],[0.05],label="visualization for probablity being 95%")
	
end

# ╔═╡ Cell order:
# ╠═a466ba50-b5a1-11eb-1a7e-91ea7ab8e4d8
# ╠═5906b020-b60e-11eb-006c-7b729fc391e0
# ╠═bd0ab610-b5a1-11eb-2fd9-d35eac588c1f
# ╠═cc116e10-b62d-11eb-361f-893b1c7c20f3
# ╠═ce6681a0-b62d-11eb-2d50-97ab249f27d1
# ╠═c700ca80-b60d-11eb-2200-7d78f1aaaaa4
# ╠═e8b79eb0-b60d-11eb-2811-019e5252c560
# ╠═1b9689e0-b60e-11eb-0ba3-bbf5018891ca
# ╠═40b2a920-b60e-11eb-3cfc-87c54f0b2bfb
# ╠═4f5b7d60-b610-11eb-1e6e-7b119b5fd219
# ╠═56897b1e-b60e-11eb-1404-2306e47ba769
