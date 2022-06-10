function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the
%   cost of using theta as the parameter for linear regression to fit the
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples
theta_m = length(theta);

% You need to return the following variables correctly
hx =  X * theta;
J = (sum((hx - y).^2) + lambda * sum(theta(2:theta_m, :).^2))/2/m;


grad = zeros(size(theta));
grad(1) = sum((hx-y).* X(:,1))/m;
grad(2:theta_m,:) = (X(:,2:theta_m)' * (hx-y))./m + theta(2:theta_m,:) * lambda / m;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%












% =========================================================================

grad = grad(:);

end
