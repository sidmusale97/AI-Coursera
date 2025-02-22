function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
reg = (lambda/(2*m))*sum(theta.^2);

sumgrad = zeros(size(X,2));
for i = 1:m
    hxi = sigmoid(theta'*X(i,:)');
    sumgrad(1) = sumgrad(1) + (hxi - y(i))*X(i,1);
end
grad(1) = sumgrad(1)/m;
for j = 2:size(X,2)
for i = 1:m
    hxi = sigmoid(theta'*X(i,:)');
    sumgrad(j) = sumgrad(j) + (hxi - y(i))*X(i,j);
end
grad(j) = (sumgrad(j)/m)+sum((lambda/m)*theta(j));
end
h = sigmoid(X*theta);
part1 = (-1*y')*log10(h);
part2 = (1-y)'*log10(1-h);
J = (1/m)*(part1 - part2) + reg;




% =============================================================

end
