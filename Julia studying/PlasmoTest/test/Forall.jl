using Plasmo
using Plots
graph = OptiGraph()

sg1 = OptiGraph()
sg2 = OptiGraph()
add_subgraph!(graph,sg1)
add_subgraph!(graph,sg2)

@optinode(sg1,ng1[1:5])
@optinode(sg2,ng2[1:5])

for node in getnodes(sg1)
    @variable(node,0 <= x <= 2)
    @objective(node,Max,x)
end

for node in getnodes(sg2)
    @variable(node,x>=2)
    @objective(node,Min,x)
end

@linkconstraint(sg1,sum(ng1[i][:x] for i = 1:5) <= 4)
@linkconstraint(sg2,sum(ng2[i][:x] for i = 1:5) >= 4)
@linkconstraint(graph,ng1[3][:x]==ng2[3][:x])

plt_G = plt_G = Plots.plot(graph,node_labels = true, markersize=60, labelsize=30, linewidth=4, layout_options = Dict(:tol => 0.01, :iterations => 2))
savefig("004.png")