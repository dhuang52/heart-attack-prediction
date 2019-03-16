function [ test_error ] = find_test_error( w, X, y )
%FIND_TEST_ERROR Find the test error of a linear separator
%   Inputs:
%       w : weight vector representing linear separator
%       X : test set
%       y: +/- 1 (column vector)

%   X does not have a column of 1s as input, so that should be added. 
%   The labels are assumed to be plus or minus one. 
%   The function returns the error on the test examples as a fraction. The 
%   hypothesis is assumed to be of the form (sign ( [1 x(n,:)] * w )
[N, ~] = size(X);
% augment with column of 1s
X = [ ones(N, 1) X ];
% replace 0s with -1
y( y == 0 ) = -1;

y_new = sign(w * X');
% error rate
test_error = mean(y' ~= y_new);
% glmfit: classification error Ein = 0.4
end

