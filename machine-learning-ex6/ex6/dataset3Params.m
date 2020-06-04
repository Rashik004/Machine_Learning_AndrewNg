function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.01;
sigma = 0.01;
probableC=zeros(1,8);
probableSigma=zeros(1,8);
probableC(1)=0.01;
probableSigma(1)=0.01;
for i=2:8
  probableC(i)=probableC(i-1)*3;
  probableSigma(i)=probableC(i);
endfor
minCost=intmax();
optimalPair=zeros(1,2);

for i=1:8
  for j=1:8
    model= svmTrain(X, y, probableC(i), @(x1, x2) gaussianKernel(x1, x2, probableSigma(j)));
    predictions = svmPredict(model, Xval);
    currentError=sum(abs(predictions-yval));
    if(currentError<minCost)
       minCost=currentError;
       optimalPair=[probableC(i), probableSigma(j)]
    endif
  endfor
endfor

 C=optimalPair(1);
 sigma=optimalPair(2);
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%







% =========================================================================

end
