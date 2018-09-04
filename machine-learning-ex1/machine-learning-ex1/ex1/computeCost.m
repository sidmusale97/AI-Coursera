function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
sum = 0;
theta = theta';
for i = 1:m
    xi = X(i,:)';
    hxi = theta*xi;
    sum = sum + (hxi - y(i))^2;
end    
    J = sum/(2*m);

end
