function [J, grad] = costFunctionReg(theta, X, y, lambda)
  

%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
%size(theta)
%size(X)
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
J=0;
%theta
n=size(theta)(1);
delta=zeros(n, 1);
for i=1:m
  currentProduct=X(i, 1:n) * theta;
  sigmoidResult=sigmoid(currentProduct);
  iterationCost=-y(i)*log(sigmoidResult)-(1-y(i))*log(1-sigmoidResult);
  %iterationGrad=(sigmoidResult-y(i))*x(i,
  delta+=(sigmoidResult-y(i))*X(i,1:n)';
  J+=iterationCost;
endfor
delta=delta/m;
grad+=delta;

J=J/m;
regular=0;
for j=2:size(theta)(1)
  regular+=theta(j)*theta(j);
endfor
regular
J=J+(lambda*regular)/(2*m);



% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta






% =============================================================

end
