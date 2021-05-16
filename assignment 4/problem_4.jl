### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 3e766560-b669-11eb-3792-8fa43a809de5
begin
	using Distributions
	using Random
	using Statistics
	using StatsBase
end

# ╔═╡ 58097c10-b669-11eb-3bc7-df3ef5d6f31e
function computeuniform(p)
	Random.seed!(1)
	global n1=1
	global n2=1
	global n3=1
	global n4=1
	while abs(mean(Normal(0.5,sqrt(12n1)))-mean(rand(Uniform(0,1),n1))) >p
		n1=n1+1
	end
	while abs(var(Normal(0.5,sqrt(12n2)))-var(rand(Uniform(0,1),n2))) >p
		n2=n2+1
	end
	while abs(skewness(Normal(0.5,sqrt(12n3)))-skewness(rand(Uniform(0,1),n3))) >p
		n3=n3+1
	end
	while abs(kurtosis(Normal(0.5,sqrt(12n4)))-kurtosis(rand(Uniform(0,1),n4))) >p
		n4=n4+1
	end
	return max(n1,n2,n3,n4)
end

# ╔═╡ 7673bd52-b669-11eb-0d24-a992cf102d05
computeuniform(0.05)

# ╔═╡ 88fdfc5e-b669-11eb-2f00-5365dbb168c6
function computesamplesizebinom1(p)
	Random.seed!(1)
	global k1=1
	global k2=1
	global k3=1
	global k4=1
	while abs(mean(Normal(0.01*k1,sqrt(0.01*(1-0.01))))-mean(rand(Bernoulli(0.01),k1))) >p
		k1=k1+1
	end
	while abs(var(Normal(0.01*k2,sqrt(0.01*(1-0.01))))-var(rand(Bernoulli(0.01),k2))) >p
		k2=k2+1
	end
	while abs(skewness(Normal(0.01*k3,sqrt(0.01*(1-0.01))))-skewness(rand(Bernoulli(0.01),k3))) >p
		k3=k3+1
	end
	while abs(kurtosis(Normal(0.01*k4,sqrt(0.01*(1-0.01))))-kurtosis(rand(Bernoulli(0.01),k4))) >p
		k4=k4+1
	end
	return max(k1,k2,k3,k4)
end

# ╔═╡ ae2454d0-b669-11eb-20bb-61b7415f8e34
computesamplesizebinom1(0.05)

# ╔═╡ ba254c80-b669-11eb-28d0-711226dd21b1
function computesamplesizebinom2(p)
	Random.seed!(1)
	global m1=1
	global m2=1
	global m3=1
	global m4=1
	while abs(mean(Normal(0.5*m1,sqrt(0.5*(1-0.5))))-mean(rand(Bernoulli(0.5),m1))) >p
		m1=m1+1
	end
	while abs(var(Normal(0.5*m2,sqrt(0.5*(1-0.5))))-var(rand(Bernoulli(0.5),m2))) >p
		m2=m2+1
	end
	while abs(skewness(Normal(0.5*m3,sqrt(0.5*(1-0.5))))-skewness(rand(Bernoulli(0.5),m3))) >p
		m3=m3+1
	end
	while abs(kurtosis(Normal(0.5*m4,sqrt(0.5*(1-0.5))))-kurtosis(rand(Bernoulli(0.5),m4))) >p
		m4=m4+1
	end
	return max(m1,m2,m3,m4)
end

# ╔═╡ c892d760-b669-11eb-3de6-ad9560fe5125
computesamplesizebinom2(0.05)

# ╔═╡ d5099b50-b669-11eb-152d-1fdb4ad146cb
function computesamplesizechi(p)
	Random.seed!(1)
	global s1=1
	global s2=1
	global s3=1
	global s4=1
	while abs(mean(Normal(3,sqrt(6/s1)))-mean(rand(Chi(3),s1))) >p
		s1=s1+1
	end
	while abs(var(Normal(3,sqrt(6/s2)))-var(rand(Chi(3),s2))) >p
		s2=s2+1
	end
	while abs(skewness(Normal(3,sqrt(6/s3)))-skewness(rand(Chi(3),s3))) >p
		s3=s3+1
	end
	while abs(kurtosis(Normal(3,sqrt(6/s4)))-kurtosis(rand(Chi(3),s4))) >p
		s4=s4+1
	end
	return max(s1,s2,s3,s4)
end

# ╔═╡ Cell order:
# ╠═3e766560-b669-11eb-3792-8fa43a809de5
# ╠═58097c10-b669-11eb-3bc7-df3ef5d6f31e
# ╠═7673bd52-b669-11eb-0d24-a992cf102d05
# ╠═88fdfc5e-b669-11eb-2f00-5365dbb168c6
# ╠═ae2454d0-b669-11eb-20bb-61b7415f8e34
# ╠═ba254c80-b669-11eb-28d0-711226dd21b1
# ╠═c892d760-b669-11eb-3de6-ad9560fe5125
# ╠═d5099b50-b669-11eb-152d-1fdb4ad146cb
