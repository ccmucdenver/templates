"""Solve a small linear optimization problem using Gurobi."""
import gurobipy as gp

with gp.Env() as env, gp.Model("simple", env=env) as model:
    model.Params.Threads = 1

    # Maximize 3*x + 2*y subject to x + y <= 4.
    x = model.addVar(lb=0, ub=2, name="x")
    y = model.addVar(lb=0, name="y")
    model.addConstr(x + y <= 4)
    model.setObjective(3*x + 2*y, gp.GRB.MAXIMIZE)
    model.optimize()

    if model.Status != gp.GRB.OPTIMAL:
        raise RuntimeError("No optimal solution found.")
    print(f"x={x.X:g}, y={y.X:g}, objective={model.ObjVal:g}")
