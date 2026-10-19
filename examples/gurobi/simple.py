"""Authenticate with the personal WLS license and solve a tiny LP."""
from pathlib import Path
import math
import socket
import gurobipy as gp

print("Host:", socket.gethostname(), flush=True)
print("Gurobi version:", gp.gurobi.version(), flush=True)
print("Git commit/changed lines: not applicable (standalone test)", flush=True)

# Load only WLS parameters; no credential values are printed.
fields = {}
for line in (Path.home() / "gurobi.lic").read_text().splitlines():
    key, separator, value = line.partition("=")
    if separator:
        fields[key.strip()] = value.strip()
options = {"WLSACCESSID": fields["WLSACCESSID"],
           "WLSSECRET": fields["WLSSECRET"],
           "LICENSEID": int(fields["LICENSEID"]), "OutputFlag": 0}
print("Starting explicit WLS authentication...", flush=True)

# Context managers release both the model and its license session.
with gp.Env(params=options) as env, gp.Model("simple_test", env=env) as model:
    model.Params.Threads = 1
    model.Params.TimeLimit = 10
    x = model.addVar(lb=0, ub=2, name="x")
    y = model.addVar(lb=0, name="y")
    model.addConstr(x + y <= 4, name="capacity")
    model.setObjective(3 * x + 2 * y, gp.GRB.MAXIMIZE)
    model.optimize()
    if model.Status != gp.GRB.OPTIMAL:
        raise RuntimeError(f"Expected optimal status; got {model.Status}")
    # The known optimum provides an independent numerical check.
    for name, actual, expected in (("x", x.X, 2), ("y", y.X, 2),
                                   ("objective", model.ObjVal, 10)):
        print(f"{name}={actual:g} (expected {expected:g})", flush=True)
        if not math.isclose(actual, expected, rel_tol=0, abs_tol=1e-7):
            raise RuntimeError(f"Unexpected {name}")
print("PASS: WLS authentication and optimization succeeded; session released.", flush=True)
