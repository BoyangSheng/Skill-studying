#以一个时层中所有的部件状况为一个子图，约束主要是子图间的时间关系
#也就是时层与时层的关系
using Plasmo
using Ipopt
using PlasmoTest
#using Plots

G = OptiGraph()
O = Ipopt.Optimizer

n1 = OptiGraph()
n2 = OptiGraph()
n3 = OptiGraph()
add_subgraph!(G,n1)
add_subgraph!(G,n2)
add_subgraph!(G,n3)

# “nxy” 表示 “第x个子图中的第y个结点”
n11 = @optinode(n1,n11)
n12 = @optinode(n1,n12)
n21 = @optinode(n2,n21)
n22 = @optinode(n2,n22)
n31 = @optinode(n3,n31)
n32 = @optinode(n3,n32)

#所有子图中的1结点和2结点分别相同，即n11、n21、n31相同
#Node n11 Model
@variable(n11,0 <= x11 <= 2)
@variable(n11,2 <= y11 <= 4)
@constraint(n11,x11 + y11 >= 5)

#Node n12 Model
@variable(n12,x12)
@NLnodeconstraint(n12,ref,exp(x12) >= 2)
@variable(n12,y12 >= 0)
@constraint(n12,x12 + y12 >= 3)

#Node n21 Model
@variable(n21,0 <= x21 <= 2)
@variable(n21,2 <= y21 <= 4)
@constraint(n21,x21 + y21 >= 5)

#Node n22 Model
@variable(n22,x22)
@NLnodeconstraint(n22,ref,exp(x22) >= 2)
@variable(n22,y22 >= 0)
@constraint(n22,x22 + y22 >= 3)

#Node n31 Model
@variable(n31,0 <= x31 <= 2)
@variable(n31,2 <= y31 <= 4)
@constraint(n31,x31 + y31 >= 5)

#Node n32 Model
@variable(n32,x32)
@NLnodeconstraint(n32,ref,exp(x32) >= 2)
@variable(n32,y32 >= 0)
@constraint(n32,x32 + y32 >= 3)

#Add linkconstraint
@linkconstraint(G,n11[:x11]==n12[:y12])
@linkconstraint(G,n12[:x12]==n21[:y21])
@linkconstraint(G,n12[:y12]==n22[:y22])
@linkconstraint(G,n22[:x22]==n31[:y31])
@linkconstraint(G,n22[:y22]==n32[:y32])
#Graph objective
@objective(G, Min, n12[:x12] + n22[:x22] + n32[:x32])

optimize!(G,O)
println("x11 = ",digit5(value(n11,n11[:x11])))
println("x12 = ",digit5(value(n12,n12[:x12])))
println("x21 = ",digit5(value(n21,n21[:x21])))
println("x22 = ",digit5(value(n22,n22[:x22])))
println("x31 = ",digit5(value(n31,n31[:x31])))
println("x32 = ",digit5(value(n32,n32[:x32])))
println("Objective = ", digit5(objective_value(G)))
#plt_G = plt_G = Plots.plot(G,node_labels = true, markersize=60, labelsize=30, linewidth=4, layout_options = Dict(:tol => 0.01, :iterations => 2))
#savefig("003.png")