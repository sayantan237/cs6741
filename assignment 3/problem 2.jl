### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 3024ec20-953a-11eb-2359-69b76c83e912
begin
	using Plots
	pyplot()
end

# ╔═╡ 77732a10-953a-11eb-1d5d-1f4a4179a55e
begin
	using PlutoUI
	using StatsPlots
	using StatsBase
	using Distributions
	using LaTeXStrings
	using QuadGK
end

# ╔═╡ 44fe07c0-953b-11eb-065c-35e2b12ab705
conv1(x)=sum(pdf(Uniform(0,1),x-k)*pdf(Uniform(0,1),k) for k=0:.01:10)

# ╔═╡ e2e7e730-953b-11eb-04d9-613b7da8d063
conv1_arr=conv1.(0:.01:10)

# ╔═╡ c6ddb600-953b-11eb-2582-7ddf0f86f4c5
begin
	plot(0:.01:10,conv1.(0:.01:10),label="n=2")
	plot!(0:.01:10,[pdf(Normal(1,sqrt(1/6)),x) for x = 0:.01:10], label="Normal Pdf")
end

# ╔═╡ a951a320-9564-11eb-007f-4b125b864d27
begin
	n1=[pdf(Normal(1,sqrt(1/6)),x) for x = 0:.01:10]
	measure1=sum(conv1_arr.*log.(conv1_arr./n1))
end

# ╔═╡ 473d0900-9540-11eb-213e-874c774eb6ac
function conv2(x)
	arr1=[pdf(Uniform(0,1),x-k) for k=0:.01:10]
	return sum(arr1.*conv1_arr)
end

# ╔═╡ 56313390-9541-11eb-0941-13df07c7859c
conv2_arr=conv2.(0:.01:10)

# ╔═╡ 70060e30-9541-11eb-37c4-236a1b11b392
begin
	plot(0:.01:10,conv2.(0:.01:10),label="n=3")
	plot!(0:.01:10,[pdf(Normal(3/2,sqrt(3/12)),x) for x = 0:.01:10], label="Normal Pdf")
end

# ╔═╡ f7c74f22-9562-11eb-3ad8-fba6ee610bae
begin
	n2=[pdf(Normal(3/2,sqrt(3/12)),x) for x = 0:1:10]
	measure2=sum(conv2.(0:1:10).*log.(conv2.(0:1:10)./n2))
end

# ╔═╡ 81c93740-9542-11eb-3d6d-67f974e9d7c2
function conv3(x)
	arr2=[pdf(Uniform(0,1),x-k) for k=0:.01:10]
	return sum(arr2.*conv2_arr)
end

# ╔═╡ 6ea1150e-9543-11eb-3b8a-ed66cfd9d201
conv3_arr=conv3.(0:.01:10)

# ╔═╡ 7d5c98e0-9543-11eb-334f-67d64b182a15
begin
	plot(0:.01:10,conv3.(0:.01:10),label="n=4")
	plot!(0:.01:10,[pdf(Normal(4/2,sqrt(4/12)),x) for x = 0:.01:10], label="Normal Pdf")
end

# ╔═╡ 976e0ee0-9565-11eb-23b3-abc45f87fe28
begin
	n3=[pdf(Normal(4/2,sqrt(4/12)),x) for x = 0:.01:10]
	measure3=sum(conv3_arr.*log.(conv3_arr./n3))
end

# ╔═╡ 9d2f43c0-9543-11eb-1489-1dd24c138ba8
function conv4(x)
	arr3=[pdf(Uniform(0,1),x-k) for k=0:.01:10]
	return sum(arr3.*conv3_arr)
end

# ╔═╡ b5ad8f10-9543-11eb-1a62-8123848d3187
conv4_arr=conv4.(0:.01:10)

# ╔═╡ ca08bd8e-9543-11eb-2c91-23c77cc493dc
plot(0:.01:10,conv4.(0:.01:10),label="n=5")

# ╔═╡ 02ead030-9544-11eb-3cde-67617f8d5752
function conv5(x)
	arr4=[pdf(Uniform(0,1),x-k) for k=0:.01:10]
	return sum(arr4.*conv4_arr)
end

# ╔═╡ 2382c6e0-9544-11eb-10a3-cf365c5e664c
conv5_arr=conv5.(0:.01:10)

# ╔═╡ 32e5ae3e-9544-11eb-29a7-6bf0c02b0499
plot(0:.01:10,conv5.(0:.01:10),label="n=6")

# ╔═╡ 51afe9d0-9544-11eb-2040-add3065e695d
function conv6(x)
	arr5=[pdf(Uniform(0,1),x-k) for k=0:.01:10]
	return sum(arr5.*conv5_arr)
end

# ╔═╡ a42b0690-9544-11eb-0cba-838878df218b
conv6_arr=conv6.(0:.01:10)

# ╔═╡ b2b62b90-9544-11eb-38d4-79f24e74fbb7
plot(0:.01:10,conv6.(0:.01:10),label="n=7")

# ╔═╡ c51dc770-9544-11eb-1200-e12021114b68
function conv7(x)
	arr6=[pdf(Uniform(0,1),x-k) for k=0:.01:10]
	return sum(arr6.*conv6_arr)
end

# ╔═╡ ddd412b0-9544-11eb-0d82-9f7f6e2a04a5
conv7_arr=conv7.(0:.01:10)

# ╔═╡ ecdbbab0-9544-11eb-382f-bd473e285c01
plot(0:.01:10,conv7.(0:.01:10),label="n=8")

# ╔═╡ 00ec72b0-9545-11eb-2ab7-e73b5a5682ff
function conv8(x)
	arr7=[pdf(Uniform(0,1),x-k) for k=0:.01:10]
	return sum(arr7.*conv7_arr)
end

# ╔═╡ de70ab60-9545-11eb-3326-3ba12c3c18e5
conv8_arr=conv8.(0:.01:10)

# ╔═╡ fb9af290-9545-11eb-0c84-35c5c48b6268
plot(0:.01:10,conv8.(0:.01:10),label="n=9")

# ╔═╡ 077eec62-9546-11eb-34a1-2329a0c48503
function conv9(x)
	arr8=[pdf(Uniform(0,1),x-k) for k=0:.01:10]
	return sum(arr8.*conv8_arr)
end

# ╔═╡ 2053bc20-9546-11eb-0702-45ae657248b4
conv9_arr=conv9.(0:.01:10)

# ╔═╡ 42ed2820-9546-11eb-0440-ff2724a7ff21
plot(0:.01:10,conv9.(0:.01:10),label="n=10")

# ╔═╡ Cell order:
# ╠═3024ec20-953a-11eb-2359-69b76c83e912
# ╠═77732a10-953a-11eb-1d5d-1f4a4179a55e
# ╠═44fe07c0-953b-11eb-065c-35e2b12ab705
# ╠═e2e7e730-953b-11eb-04d9-613b7da8d063
# ╠═c6ddb600-953b-11eb-2582-7ddf0f86f4c5
# ╠═a951a320-9564-11eb-007f-4b125b864d27
# ╠═473d0900-9540-11eb-213e-874c774eb6ac
# ╠═56313390-9541-11eb-0941-13df07c7859c
# ╠═70060e30-9541-11eb-37c4-236a1b11b392
# ╠═f7c74f22-9562-11eb-3ad8-fba6ee610bae
# ╠═81c93740-9542-11eb-3d6d-67f974e9d7c2
# ╠═6ea1150e-9543-11eb-3b8a-ed66cfd9d201
# ╠═7d5c98e0-9543-11eb-334f-67d64b182a15
# ╠═976e0ee0-9565-11eb-23b3-abc45f87fe28
# ╠═9d2f43c0-9543-11eb-1489-1dd24c138ba8
# ╠═b5ad8f10-9543-11eb-1a62-8123848d3187
# ╠═ca08bd8e-9543-11eb-2c91-23c77cc493dc
# ╠═02ead030-9544-11eb-3cde-67617f8d5752
# ╠═2382c6e0-9544-11eb-10a3-cf365c5e664c
# ╠═32e5ae3e-9544-11eb-29a7-6bf0c02b0499
# ╠═51afe9d0-9544-11eb-2040-add3065e695d
# ╠═a42b0690-9544-11eb-0cba-838878df218b
# ╠═b2b62b90-9544-11eb-38d4-79f24e74fbb7
# ╠═c51dc770-9544-11eb-1200-e12021114b68
# ╠═ddd412b0-9544-11eb-0d82-9f7f6e2a04a5
# ╠═ecdbbab0-9544-11eb-382f-bd473e285c01
# ╠═00ec72b0-9545-11eb-2ab7-e73b5a5682ff
# ╠═de70ab60-9545-11eb-3326-3ba12c3c18e5
# ╠═fb9af290-9545-11eb-0c84-35c5c48b6268
# ╠═077eec62-9546-11eb-34a1-2329a0c48503
# ╠═2053bc20-9546-11eb-0702-45ae657248b4
# ╠═42ed2820-9546-11eb-0440-ff2724a7ff21
