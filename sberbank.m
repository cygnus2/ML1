%% ========= test data analysis ======== %%
%% Initialization
clear ; close all; clc;
% Loading data for analyisis 
fprintf('Reading train.csv ... \n');
[X, Xlab, y]=loadData;
%number of examples
m=size(X,1);
%number of features
nf = size(X,2);
%
id = X(:,1);
%
%y = [ raw{[2:m],mf} ];
%
%% plot a histogram of the price, just for fun
plotData(id, y)

% plot the percentage of nan per feature
figure;
plot(sum(isnan(X))/m);
xlabel('feature');
ylabel('% of nan');

% remove features which have 100% of nan values
% do not delete this as it might be useful later on
% X=X(:,~all(isnan(X)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temporarily work only with features 3,4,5 = full_sq, life_sq, floor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Xtemp=X(:,3:5);
Xtemp=[id Xtemp y]; %add id and y (maybe this can be done in just one step)
Xtemp=Xtemp(~any(isnan(Xtemp),2),:); %remove all rows which contain at least one nan
meff=size(Xtemp,1); %effective number of examples after removing nan
nfeff=size(Xtemp,2)-1; %effective number of features

% check correlations
Rmat=corr(Xtemp(:,2:end));
fprintf("Rmat contains a naive analysis of correlations. The last ...
column/row corresponds to the price. \n");
Rmat

% Just some random check, lets plot full_sq vs life_sq
fprintf('Checking full_sq vs life_sq ...\n');
figure;
plot(Xtemp(:,2),Xtemp(:,3),'*');
hold;
plot(linspace(1,max(Xtemp(:,2)),max(Xtemp(:,2))));
xlabel('full_sq');
ylabel('life_sq');
hold;


% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[x mu sigma] = featureNormalize(Xtemp(:,2:end -1)); %do not use the id column or y
x = [ones(meff, 1), x]; % Add a column of ones to x
%
%% running gradient descent
fprintf('Running gradient descent ...\n');
%
%% Choose some alpha value
alpha = 0.1;
num_iters = 400;
%
%% Init Theta and Run Gradient Descent 
theta = zeros(nfeff, 1);
[theta, J_history] = gradientDescentMulti(x, Xtemp(:,end), theta, alpha, num_iters);
%
%% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
%
%% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');
