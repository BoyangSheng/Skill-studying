

@NLconstraint(graph, x * y <= 1)
@NLconstraint(graph, x^2 / 3 <= 1)

@NLexpression(graph, name, exp(x))
@NLconstraint(graph, name + y == 0)

@NLconstraint(graph, sin(x)*cos(y) == 5)
@NLconstraint(graph, sin(x)*cos(y) == 5)
@NLconstraint(graph, nlconstr[i=1:2], i*x^2 == i)
@NLconstraint(graph, -0.5 <= sin(x) <= 0.5)
ψ(x) = 1, t(x,y) = 2
@NLconstraint(graph, ψ(x) + t(x,y) <= 3)

graph = Model()
@variable(graph, x)
@NLconstraint(graph, x <= sum(0 for i in []) + prod(1 for i in []))

