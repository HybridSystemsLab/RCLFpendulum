function out = restitutionE(mu,e0,e1)

out = e1 + mu*(e1-e0)/(pi/2);