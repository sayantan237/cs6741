### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ bc116310-7e58-11eb-2d2b-a3653078c080
using DataFrames

# ╔═╡ 72d70fc0-7e5c-11eb-32ad-356ba0084ac0
begin
	df1=DataFrame()
	df1.religion=["Agnostic","Atheist","Buddhist","Catholic","Dont know/refused","Evangelical Prot","Hindu","Historically Black Prot","Jehovah's Witness","Jewish"]
	df1."<\$10k"=[27,12,27,418,15,575,1,228,20,19]
	df1."\$10-20k"=[34,27,21,617,14,869,9,244,27,19]
	df1."\$20-30k"=[60,37,30,732,15,1064,7,236,24,25]
	df1."\$30-40k"=[81,52,34,670,11,982,9,238,24,25]
	df1."\$40-50k"=[76,35,33,638,10,881,11,197,21,30]
	df1."\$50-75k"=[137,70,58,1116,35,1486,34,223,30,95]
	df1."\$75-150k"=[122,68,55,1312,54,1448,53,210,22,98]
	df1."\$100-150k"=[109,54,32,32,32,32,32,32,32,32]
	df1."\$>150k"= [84,23,23,23,23,23,23,23,23,23]
	df1."Dont know/refused"=[96,25,25,25,25,25,25,25,24,25]
	
	
	df1
end

# ╔═╡ 2c099790-7e7d-11eb-1210-d5b5c28ed73b
gdf=groupby(df1,:"\$10-20k")

# ╔═╡ 7c44f61e-7e80-11eb-2b62-abea35d15131
gdf[1]

# ╔═╡ e0bee560-7e81-11eb-39c4-25df80471d78
gdfStacked=stack(gdf[1],2:11, :religion)

# ╔═╡ 75673b40-7e82-11eb-08b7-636cd9f800c2
select(gdfStacked,"religion"=>"religion","variable"=>"income","value"=>"freq")

# ╔═╡ e21c55b0-7e85-11eb-0e07-8d0568b24196
begin
	df2=DataFrame()
	df2.id=["MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004",]
	df2.year=[2010,2010,2010,2010,2010,2010,2010,2010,2010,2010]
	df2.month=[1,1,2,2,3,3,4,4,5,5]
	df2.element=["tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin"]
	df2."1"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."2"=[missing,missing,27.3,14.4,missing,missing,missing,missing,missing,missing]
	df2."3"=[missing,missing,24.1,14.4,missing,missing,missing,missing,missing,missing]
	df2."4"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."5"=[missing,missing,missing,missing,32.1,14.2,missing,missing,missing,missing]
	df2."6"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."7"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."8"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."9"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."10"=[missing,missing,missing,missing,34.5,16.8,missing,missing,missing,missing]
	df2."11"=[missing,missing,29.7,13.4,missing,missing,missing,missing,missing,missing]
	df2."12"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."13"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."14"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."15"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."16"=[missing,missing,missing,missing,31.1,17.6,missing,missing,missing,missing]
	df2."17"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."18"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."19"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."20"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."21"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."22"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."23"=[missing,missing,29.9,10.7,missing,missing,missing,missing,missing,missing]
	df2."24"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."25"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."26"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."27"=[missing,missing,missing,missing,missing,missing,36.3,16.7,33.2,18.2]
	df2."28"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."29"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."30"=[27.8,14.5,missing,missing,missing,missing,missing,missing,missing,missing]
	df2."31"=[missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	
	df2
end
	

# ╔═╡ b7699130-7eed-11eb-3363-31d90483416b
df2stacked=stack(df2,5:35,:month)

# ╔═╡ 2b4b8d60-7eee-11eb-32e5-054a6cef33b3
df2stacked_modified=dropmissing(df2stacked)

# ╔═╡ 38b0da90-7eef-11eb-2c6e-03cebf7bc909
df2stacked_modified1=sort(df2stacked_modified,:month)

# ╔═╡ 8c0c0c30-7ef1-11eb-23fe-a90f849a2638
df2stacked_modified3=insertcols!(df2stacked_modified1,1,:Id2=>["MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004","MX17004"])

# ╔═╡ 89f089c0-7ef2-11eb-2b1f-f9f98716ff7f
df2stacked_modified7=insertcols!(df2stacked_modified3,2,:year=>[2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010,2010])

# ╔═╡ 23dc3980-7ef3-11eb-33e4-bbb792ab0295
df2stacked_modified8=insertcols!(df2stacked_modified7,5,:element=>["tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin","tmax","tmin"])

# ╔═╡ e6979aa0-7ef3-11eb-0b40-15478fc6b9ef
df2stacked_modified9=["$(r[:year])-$(r[:month])-$(r[:variable])" for r in eachrow(df2stacked_modified8)]

# ╔═╡ 91e05410-7ef4-11eb-21c4-311b29bd8a44
df2stacked_modified10=insertcols!(df2stacked_modified8,6,:date=>df2stacked_modified9)

# ╔═╡ d3f8a5a2-7ef4-11eb-384e-c9b9b644fbe2
df2stacked_modified11=select!(df2stacked_modified10, Not(:year))

# ╔═╡ 3f19e100-7ef5-11eb-0da4-534cd859eb8f
df2stacked_modified12=select!(df2stacked_modified11, Not(:month))

# ╔═╡ 5e736440-7ef5-11eb-0c4c-6716c8553419
df2stacked_modified13=select!(df2stacked_modified12, Not(:variable))

# ╔═╡ b0cc2bf0-7ef5-11eb-3b0d-bbe91b53516c
df2stacked_modified14=groupby(df2stacked_modified13,:element)

# ╔═╡ 85fc2140-7ef6-11eb-3354-2d4f429c80c4
df2stacked_modified14[1]

# ╔═╡ fd4c4220-7ef6-11eb-1639-4db0f8d71c58
df2_join1=select(df2stacked_modified14[1],"Id2"=>"Id","date"=>"date","value"=>"tmax")

# ╔═╡ ae777ba0-7ef7-11eb-0848-47fe5a563ae5
df2_join2=select(df2stacked_modified14[2],"Id2"=>"Id","date"=>"date","value"=>"tmin")

# ╔═╡ 902c1790-7ef8-11eb-3c51-e5c28b5a59c3
df2_final=innerjoin(df2_join1,df2_join2, on=:date,makeunique=true)

# ╔═╡ c9779a60-7ef8-11eb-3499-1b8bf218ec3d
df2_final1=select!(df2_final, Not(:Id_1))

# ╔═╡ 205e8042-7efa-11eb-3d7d-e34dbd7e7305
begin
	df3=DataFrame()
	df3.year=[2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2000,2001,2001,2001,2001,2001,2001]
	df3.artist=["2 Pac","2 Pac","2 Pac","2 Pac","2 Pac","2 Pac","2 Pac","2Ge+her","2Ge+her","2Ge+her","3 Doors Down","3 Doors Down","3 Doors Down","3 Doors Down","3 Doors Down","3 Doors Down","504 Boyz","98^0","A*Teens","Aaliyah","Aaliyah","Adams","Adkins","Aguilera","Aguilera","Aguilera","Alice Deejay"]
	df3.time=["4:22","4:22","4:22","4:22","4:22","4:22","4:22","3:15","3:15","3:15","3:53","3:53","3:53","3:53","3:53","4:24","3:35","3:24","3:44","4:15","4:03","5:30","3:05","3:38","4:00","3:18","6:50"]
	df3.track=["Baby Dont Cry","Baby Dont Cry","Baby Dont Cry","Baby Dont Cry","Baby Dont Cry","Baby Dont Cry","Baby Dont Cry","The Hardest Part Of","The Hardest Part Of","The Hardest Part Of","Kryptonite","Kryptonite","Kryptonite","Kryptonite","Kryptonite","Loser","Wobble Wobble","Give me just one night","Dancing Queen","I dont wanna","Try again","Open my heart","More","Come on over baby","I turn to you","What a girl wants","Better off alone"]
	df3.date=["2000-02-26","2000-03-04","2000-03-11","2000-03-18","2000-03-25","2000-04-01","2000-04-08","2000-09-02","2000-09-09","2000-09-16","2000-04-08","2000-04-15","2000-04-22","2000-04-29","2000-05-06","2000-07-06","2000-07-09","2000-09-13","2000-10-14","2000-11-13","2000-12-03","2001-01-07","2001-01-14","2001-01-21","2001-01-28","2001-02-07","2001-02-14"]
	df3.week=[1,2,3,4,5,6,7,1,2,3,1,2,3,4,5,1,1,1,1,1,1,1,1,1,1,1,1]
	df3.rank=[87,82,72,77,87,94,99,91,87,92,81,70,68,67,66,missing,missing,missing,missing,missing,missing,missing,missing,missing,missing,missing,missing]
	df3
end

# ╔═╡ 13222b20-7f36-11eb-2ca0-650ded4d188c
array1=[1,1,1,1,1,1,1,2,2,2,3,3,3,3,3,4,5,6,7,8,9,10,11,12,13,14,15]

# ╔═╡ fab5f650-7f37-11eb-16b2-c3fda6f27e0e
df3_modified1=insertcols!(df3,1,:id=>array1)

# ╔═╡ 3f15edf0-7f38-11eb-3549-fd52bbdc9508
df3_modified2=df3_modified1[1:15,:]

# ╔═╡ af598db0-7f38-11eb-06c8-1b1a933f7703
df3_modified3=groupby(df3_modified2,:date)

# ╔═╡ 833c6990-7f39-11eb-39ff-17a570c669a0
df3_tidy2=combine(df3_modified3,:id=>:id,:date=>:date,:rank=>:rank)

# ╔═╡ 3a0c8110-7f3e-11eb-03b2-072c11cbc879
df3_modified4=df3_modified1[[1,8,11,16,17,18,19,20,21,22,23,24,25,26,27],:]

# ╔═╡ c3f4eac0-7f3e-11eb-1725-13782fec8097
df3_tidy1=select(df3_modified4,:id,:artist,:track,:time)

# ╔═╡ Cell order:
# ╠═bc116310-7e58-11eb-2d2b-a3653078c080
# ╠═72d70fc0-7e5c-11eb-32ad-356ba0084ac0
# ╠═2c099790-7e7d-11eb-1210-d5b5c28ed73b
# ╠═7c44f61e-7e80-11eb-2b62-abea35d15131
# ╠═e0bee560-7e81-11eb-39c4-25df80471d78
# ╠═75673b40-7e82-11eb-08b7-636cd9f800c2
# ╠═e21c55b0-7e85-11eb-0e07-8d0568b24196
# ╠═b7699130-7eed-11eb-3363-31d90483416b
# ╠═2b4b8d60-7eee-11eb-32e5-054a6cef33b3
# ╠═38b0da90-7eef-11eb-2c6e-03cebf7bc909
# ╠═8c0c0c30-7ef1-11eb-23fe-a90f849a2638
# ╠═89f089c0-7ef2-11eb-2b1f-f9f98716ff7f
# ╠═23dc3980-7ef3-11eb-33e4-bbb792ab0295
# ╠═e6979aa0-7ef3-11eb-0b40-15478fc6b9ef
# ╠═91e05410-7ef4-11eb-21c4-311b29bd8a44
# ╠═d3f8a5a2-7ef4-11eb-384e-c9b9b644fbe2
# ╠═3f19e100-7ef5-11eb-0da4-534cd859eb8f
# ╠═5e736440-7ef5-11eb-0c4c-6716c8553419
# ╠═b0cc2bf0-7ef5-11eb-3b0d-bbe91b53516c
# ╠═85fc2140-7ef6-11eb-3354-2d4f429c80c4
# ╠═fd4c4220-7ef6-11eb-1639-4db0f8d71c58
# ╠═ae777ba0-7ef7-11eb-0848-47fe5a563ae5
# ╠═902c1790-7ef8-11eb-3c51-e5c28b5a59c3
# ╠═c9779a60-7ef8-11eb-3499-1b8bf218ec3d
# ╠═205e8042-7efa-11eb-3d7d-e34dbd7e7305
# ╠═13222b20-7f36-11eb-2ca0-650ded4d188c
# ╠═fab5f650-7f37-11eb-16b2-c3fda6f27e0e
# ╠═3f15edf0-7f38-11eb-3549-fd52bbdc9508
# ╠═af598db0-7f38-11eb-06c8-1b1a933f7703
# ╠═833c6990-7f39-11eb-39ff-17a570c669a0
# ╠═3a0c8110-7f3e-11eb-03b2-072c11cbc879
# ╠═c3f4eac0-7f3e-11eb-1725-13782fec8097
