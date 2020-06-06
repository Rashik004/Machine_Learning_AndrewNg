function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
m=length(X);

for i=1:m
  lowest=intmax();
  for j=1:K
    dist=X(i,:)-centroids(j, :);
    dist=dist.^2;
    scaler=sum(dist);
    %if(i<5)
      %fprintf('sDistance Between %f and %f is %f\n',X(i, 1:2), centroids(j), scaler);
    %endif
    if(scaler<lowest)
      %if(i<5)
        %fprintf('Changing centroid for index %d from %d to %d\n',i,idx(i),j);
      %endif
      lowest=scaler;
      idx(i)=j;
    endif
  endfor
  if(i<5)
    fprintf('\n');
  endif  
endfor




% =============================================================

end

