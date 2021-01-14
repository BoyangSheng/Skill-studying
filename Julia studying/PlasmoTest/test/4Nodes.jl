using Plasmo
using Ipopt
using PlasmoTest

G = OptiGraph()
O = Ipopt.Optimizer

n1 = @optinode(G)
n2 = @optinode(G)
n3 = @optinode(G)
n4 = @optinode(G)

#Node 1 Model
@variable(n1,0 <= x1 <= 2)
@variable(n1,2 <= y1 <= 4)
@constraint(n1,x1 + y1 >= 5)
@objective(n1, Min, y1)

#Node 2 Model
@variable(n2,x2)
@NLnodeconstraint(n2,ref,exp(x2) >= 2)
@variable(n2,y2 >= 0)
@constraint(n2,x2 + y2 >= 3)
@objective(n2, Min, x2)

#Node 3 Model
@variable(n3,0 <= x3 <= 2)
@variable(n3,2 <= y3 <= 4)
@variable(n3,4 <= z3 <= 6)
@constraint(n3,9 <= x3 + y3 + z3 <= 11)

#Node 4 Model
@variable(n4,x4)
@NLnodeconstraint(n4,ref,x4^2 <= 16)
@variable(n4,y4 >= 0)
@variable(n4,z4 <= 4)
@constraint(n4,(x4 + y4)*z4 >= 12)

#Add linkconstraint
@linkconstraint(G,n1[:x1]==n2[:y2])
@linkconstraint(G,n2[:x2]==n3[:z3])
@linkconstraint(G,n2[:y2]==n4[:y4])

#Graph objective
@objective(G, Min, n1[:y1] + n2[:x2] + n3[:z3] + n4[:x4])

optimize!(G,O)

println("x1 = ",digit5(value(n1,n1[:x1])))
println("y1 = ",digit5(value(n1,n1[:y1])))
println("x2 = ",digit5(value(n2,n2[:x2])))
println("y2 = ",digit5(value(n2,n2[:y2])))
println("x3 = ",digit5(value(n3,n3[:x3])))
println("y3 = ",digit5(value(n3,n3[:y3])))
println("z3 = ",digit5(value(n3,n3[:z3])))
println("x4 = ",digit5(value(n4,n4[:x4])))
println("y4 = ",digit5(value(n4,n4[:y4])))
println("z4 = ",digit5(value(n4,n4[:z4])))
println("Objective = ", digit5(objective_value(G)))

#plt_G = plt_G = Plots.plot(G,node_labels = true, markersize=60, labelsize=30, linewidth=4, layout_options = Dict(:tol => 0.01, :iterations => 2))
#savefig("002.png")