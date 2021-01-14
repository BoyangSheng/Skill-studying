#This program is to test if two Nodes exist
#with only one objective functions.
using Plasmo
using Ipopt
using PlasmoTest

G = OptiGraph()
O = Ipopt.Optimizer

#Add nodes to a ModelGraph
n1 = @optinode(G)
n2 = @optinode(G)

#Node 1 Model
@variable(n1,0 <= x1 <= 2)
@variable(n1,2 <= y1 <= 4)
@constraint(n1,x1 + y1 >= 5)

#Node 2 Model
@variable(n2,x2)
@NLnodeconstraint(n2,ref,exp(x2) >= 2)
@variable(n2,y2 >= 0)
@constraint(n2,x2 + y2 >= 3)

#Add linkconstraint
@linkconstraint(G,n1[:x1]==n2[:y2])

#Graph objective
@objective(G, Min, n1[:x1] + n2[:x2])

#Use Ipopt to solve
optimize!(G,O)

println("x1 = ",digit5(value(n1,n1[:x1])))
println("y1 = ",digit5(value(n1,n1[:y1])))
println("x2 = ",digit5(value(n2,n2[:x2])))
println("y2 = ",digit5(value(n2,n2[:y2])))
println("Objective = ", digit5(objective_value(G)))