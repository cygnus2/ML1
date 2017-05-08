%% ========= test data analysis ======== %%
%% Initialization
clear ; close all; clc
% Complete warmUpExercise.m 
fprintf('Reading train.csv ... \n');
%this is random
% load package for reading csv files
pkg load io
% load raw training data
raw = csv2cell('../train.csv');
% it seems like there are some 'NA' fields which screw up the analysis
% replacing them by 0
raw(strcmp('NA',raw))={0};
% size of training set
m = size(raw,1) - 1; 
%number of features
mf = size(raw,2);

% try a simple linear regression model using the features
% full_sq, life_sq and floor
id = [ raw{[2:m+1],1} ];

x = [ raw{[2:m+1],[3:5]}];
x = reshape(x, size(x,2)/3, 3);
y = [ raw{[2:m+1],mf} ];

% plot a histogram, just for fun
plotData(id, y)

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[x mu sigma] = featureNormalize(x);
x = [ones(m, 1), x]; % Add a column of ones to x

% running gradient descent
fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.1;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(4, 1);
[theta, J_history] = gradientDescentMulti(x, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');
