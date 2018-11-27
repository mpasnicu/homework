addpath('/Users/mihai/Desktop/Second year/Empirical Methods/Lectures/CEtools');

data = load('/Users/mihai/Desktop/Second year/Empirical Methods/homework5/hw5.mat');

X = data.data.X';
Y = data.data.Y';
Z = data.data.Z';

clear data;


%% question 1

% generate values

[x, w] = qnwnorm(20, 0.1, 1); 
nodes.nx = x;
nodes.ny = 0;
l1 = like(0, w, nodes, Y, X, Z);



%% question 2

rng(100);
nodes2.nx = randn(100, 1) + 0.1;
nodes2.ny = 0;
w2 = 1 / length(nodes2.nx);
l2 = like(0, w2, nodes2, Y, X, Z);



%% question 3 - Gaussian Quadrature

func31 = @(x) zero_gauss(x(1), x(2), x(3), Y, X, Z);
x31 = [1, 1, 1];
[arg31, fval31] = fminsearch(func31, x31);



%% question 3 - Monte Carlo

func32 = @(x) zero_mc(x(1), x(2), x(3), Y, X, Z);
x31 = [1, 1, 1];
e = 0;
t = 1;
while (e ~= 1) && (t < 10)
    tic
    [x31, fval32, e] = fminsearch(func32, x31);
    t = t + 1;
    toc
end

