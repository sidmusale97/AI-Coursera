f = [7 9 15 25 40 75 100 150]';
k = [.29 .37 .48 .65 .8 .97 .99 1.07]';

X = [ones(length(f), 1), f(:,1)]; % Add a column of ones to f
theta = zeros(2, 1); % initialize fitting parameters

numiterations = 1000;
alpha = .001;

theta = gradientDescent(X, k, theta, alpha, numiterations); 