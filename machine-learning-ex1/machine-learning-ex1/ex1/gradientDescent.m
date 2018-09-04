function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
   
    sum0 = 0;
    sum1 = 0;
    theta = theta';
    for i = 1:m
       xi = X(i,:)';
       hxi = theta*xi;
       sum0 = sum0 + (hxi - y(i));
       sum1 = sum1 + (hxi-y(i))*X(i,2);    
    end
    change0 = alpha/m*sum0;   
    change1 = alpha/m*sum1;
    theta0 = theta(1,1) - change0;
    theta1 = theta(1,2) - change1;
    theta = [theta0, theta1]';

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
