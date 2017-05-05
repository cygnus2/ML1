%% ========= test data analysis ======== %%
%% Initialization
clear ; close all; clc
% Complete warmUpExercise.m 
fprintf('Reading test.csv ... \n');

% load package for reading csv files
%package load io
% load raw training data
raw = csv2cell('test.csv');
% size of training set
m = size(raw,1) - 1; 
%number of features
mf = size(raw,2);

x = [ raw{[2:m+1],1} ];
%X = [ones(m, 1), ]; % Add a column of ones to x
plot(x, '-')