function myscplot(x,y,xlab)
% just to automatize the production of plots
  if nargin<3
    xlab='no Label';
  end

  figure;
  noNan=[x y];
  noNan=noNan(~any(isnan(noNan),2),:); %remove all rows which contain at least one nan
  % now remove outliers, simply delete anything above percentile 98

  Q=prctile(noNan(:,1),98);
  outlierInd=noNan(:,1)>Q; %get the indices of those values above the percentile 98

  noNan(outlierInd,:)=[]; %remove outliers

  x=noNan(:,1);
  y=noNan(:,2);

  plot(x,y,'*');
  xlabel(xlab);
  ylabel('price_doc');

end
