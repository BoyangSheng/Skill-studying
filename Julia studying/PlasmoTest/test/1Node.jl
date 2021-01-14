#This program is to test if only one node exists.
using Plasmo
using Gurobi
using PlasmoTest

graph = OptiGraph()
optimizer = Gurobi.Optimizer

#Add only one node to a ModelGraph
n1 = @optinode(graph)

#For this node
@variable(n1,0 <= x <= 2)
@variable(n1,2 <= y <= 4)
@constraint(n1,x + y >= 5)

#Graph objective
@objective(graph, Min, n1[:y])

#Use Ipopt to solve
optimize!(graph, optimizer)

println("y = ",value(n1,n1[:y]))