#This program is to test if two Nodes exist
#with their own objective functions.
using Plasmo
using Ipopt
using PlasmoTest
using Plots

G = OptiGraph()
O = Ipopt.Optimizer

#Add nodes to a ModelGraph
n1 = @optinode(G)
n2 = @optinode(G)

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

#Add linkconstraint
@linkconstraint(G,n1[:x1]==n2[:y2])

#Use Ipopt to solve
optimize!(G,O)

println("x1 = ",digit5(value(n1,n1[:x1])))
println("y1 = ",digit5(value(n1,n1[:y1])))
println("x2 = ",digit5(value(n2,n2[:x2])))
println("y2 = ",digit5(value(n2,n2[:y2])))

#plt_G = plt_G = Plots.plot(G,node_labels = true, markersize=60, labelsize=30, linewidth=4, layout_options = Dict(:tol => 0.01, :iterations => 2))
#savefig("001.png")