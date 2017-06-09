function [X,Xlab,y]=loadData(produce)
%function [X,Xlab,y]=loadData(produce)
% loads the data from train.csv and outputs the data X, the lable row Xlab 
% and the  predicted values y
% X and y are matrices while Xlab is a cell array
% All non-numeric values are transformed to NaN
% if produce==0 or ommited loads from train.csv and produces train.mat if it has 
% not been produced before, otherwise simply loads train.mat
% if produce==1 loads from test.csv and produces test.mat if it has not been 
% produced before, otherwise simply loads test.mat

if nargin<1
  produce=0;
end

trfile=exist('train.mat');
tefile=exist('test.mat');

if produce==0
% load the train dataset
  if trfile==0
    %load package for reading csv files
    pkg load io
    %load raw training data
    raw=csv2cell('train.csv');
    
    %preparing output for analysis
    Xlab=raw(1,:); %extract cell array with labels of the features
    raw(1,:)=[]; %clean up raw data, eliminate labels row
    %prepare the timestamp variable
    for ti=1:size(raw,1)
      temptime(ti,1)=datenum(raw{ti,2},29); %save the timestamp in temporary variable temptime
    end
    indchar=cellfun(@ischar,raw); %get the indices of non-numeric values
    raw(indchar)={nan}; %transform all non-numeric values to nan for easier manipulation
    rawmat=cell2mat(raw); %transform raw cell data to a matrix
    y=rawmat(:,end);
    X=rawmat(:,1:end-1);
    X(:,2)=temptime; %add the timestamp variable to the data
    
    %save the data to avoid loading it all the time
    save train.mat X Xlab y;
    
    clear raw rawmat; %clean up
  else
    load('train.mat');
    X;Xlab;y;
  end
else
% load the test dataset
  if tefile==0
    %load package for reading csv files
    pkg load io
    %load raw training data
    raw=csv2cell('test.csv');
    
    %preparing output for analysis
    Xlab=raw(1,:); %extract cell array with labels of the features
    raw(1,:)=[]; %clean up raw data, eliminate labels row
    %prepare the timestamp variable
    for ti=1:size(raw,1)
      temptime(ti,1)=datenum(raw{ti,2},29); %save the timestamp in temporary variable temptime
    end
    indchar=cellfun(@ischar,raw); %get the indices of non-numeric values
    raw(indchar)={nan}; %transform all non-numeric values to nan for easier manipulation
    rawmat=cell2mat(raw); %transform raw cell data to a matrix
%    y=rawmat(:,end);
    X=rawmat(:,1:end);
    X(:,2)=temptime; %add the timestamp variable to the data
    
    %save the data to avoid loading it all the time
    save test.mat X Xlab;
    
    clear raw rawmat; %clean up

  else
    load('test.mat');
    X;Xlab;
  end

end

end
