function [x_norm, mu, sigma] = featureNormalize(x)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
x_norm = x;
mu = zeros(1, size(x, 2));
sigma = zeros(1, size(x, 2));
mu = mean(x);
sigma = std(x);
for i = 1:size(x,2)
 x_norm(:,i) = (x_norm(:,i) - mu(i))/sigma(i);
end

% ============================================================

end
