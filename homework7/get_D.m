function [D_0, D_1, D_2] = get_D(P_1, P_2)

% simple function that computes D

global L v;


imp = 1 + exp(v - P_1) + exp(v - P_2);
D_0   = ones(L, L) ./ imp;
D_1   = exp(v - P_1) ./ imp;
D_2   = exp(v - P_2) ./ imp;
 
end