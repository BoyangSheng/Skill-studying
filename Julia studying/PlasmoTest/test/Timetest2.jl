#以一个部件在所有时层的状况为一个子图，约束主要是子图间的空间关系
#也就是部件与部件的关系
using Plasmo, Ipopt
using PlasmoTest

G = OptiGraph()         #建立主图
O = Ipopt.Optimizer     #求解器为Ipopt

sub1 = OptiGraph()      #建立子图
sub2 = OptiGraph()
add_subgraph!(G,sub1)   #把子图加到主图中
add_subgraph!(G,sub2)

@optinode(sub1,ng1[1:3])    #子图有1-3三个结点
@optinode(sub2,ng2[1:3])

for node in getnodes(sub1)      #批量添加结点，这些结点内部数学表达是相同的
    @variable(node,0 <= x <= 2)
    @variable(node,2 <= y <= 4)
    @constraint(node,x + y >= 5)
end

for node in getnodes(sub2)
    @variable(node,x)
    @NLnodeconstraint(node,exp(x) >= 2)
    @variable(node,y >= 0)
    @constraint(node,x + y >= 3)
end

#添加约束，“ng?[x]”表示 “第?个子图的第x个结点”
@linkconstraint(G,ng1[1][:x]==ng2[1][:y])
@linkconstraint(G,ng2[1][:x]==ng1[2][:y]+1)
@linkconstraint(G,ng2[1][:y]==ng2[2][:y])
@linkconstraint(G,ng2[2][:x]==ng1[3][:y])
@linkconstraint(G,ng2[2][:y]==ng2[3][:y])

#添加目标函数
@objective(G, Min, ng2[1][:x] + ng2[2][:x] + ng2[3][:x])
optimize!(G,O)          #G和O都在最开始有定义
println("Objective = ", digit5(objective_value(G)))

#把图的关系保存成图片
#plt_G = plt_G = Plots.plot(G,node_labels = true, markersize=60, labelsize=30, linewidth=4, layout_options = Dict(:tol => 0.01, :iterations => 2))
#savefig("006.png")