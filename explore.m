%% ========= script to explore the features ======== %%
%% Here we produce plots, analysis of autocorrelation, etc
%% Initialization
clear ; close all; clc;
% Loading data for analyisis 
fprintf('Reading train.mat ... \n');
[X, Xlab, y]=loadData;
% Useful info about the data
m=size(X,1);%number of examples
nf = size(X,2);%number of features
%
id = X(:,1);
%% plot a histogram of the price, just for fun
fprintf('First print a histogram of the price \n');
plotData(id, y)
%% plot a histogram of the log(price), just for fun
fprintf('Now print a histogram of the log of the price \n');
plotData(id,log(y))

% plot the percentage of nan per feature
fprintf('Now plot the percentage of NaN values per feature \n');
figure;
plot(100*sum(isnan(X))/m);
xlabel('feature');
ylabel('% of nan');

% remove features which have 100% of nan values
% do not delete this as it might be useful later on
allnanX=~all(isnan(X)); %get the indices of columns which have all Nan values
X=X(:,allnanX);
Xlab=Xlab(allnanX);

% Scatter plots of all relevant variables vs. price

fprintf('\n Let us now look at the scatter plots of all variables vs log(price), where potential outliers have been removed for better visibility. \n \n');

for i=1:10
  labx=Xlab{i};
  myscplot(X(:,i),log(y),labx); %do a scatter plot of feature i vs log(price)
  fprintf(sprintf('Now ploting %s vs log(price_doc) \n',labx));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% temporarily work only with features 3,4,5 = full_sq, life_sq, floor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Xtemp=X(:,3:5);
%Xtemp=[id Xtemp y]; %add id and y (maybe this can be done in just one step)
%Xtemp=Xtemp(~any(isnan(Xtemp),2),:); %remove all rows which contain at least one nan
%meff=size(Xtemp,1); %effective number of examples after removing nan
%nfeff=size(Xtemp,2)-1; %effective number of features
%
%% check correlations
%Rmat=corr(Xtemp(:,2:end));
%fprintf("Rmat contains a naive analysis of correlations. The last ...
%column/row corresponds to the price. \n");
%Rmat
%
%% Just some random check, lets plot full_sq vs life_sq
%fprintf('Checking full_sq vs life_sq ...\n');
%figure;
%plot(Xtemp(:,2),Xtemp(:,3),'*');
%hold;
%plot(linspace(1,max(Xtemp(:,2)),max(Xtemp(:,2))));
%xlabel('full_sq');
%ylabel('life_sq');
%hold;
%
%
