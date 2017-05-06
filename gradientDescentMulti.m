function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
     theta = theta - (X'*(X*theta-y))*alpha/m;
    % ============================================================
    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);
end
end
  
function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y
% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
J = (X*theta-y)'*(X*theta-y)/(2*size(y,1));
% =========================================================================
end
