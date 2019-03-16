function [ w, e_in ] = logistic_reg( X, y, w_init, max_its, eta )
%LOGISTIC_REG Learn logistic regression model using gradient descent
%   Inputs:
%       X : data matrix (without an initial column of 1s)
%       y : data labels (+/- 1)
%       w_init: initial value of the w vector (d+1 dimensional)
%       max_its: maximum number of iterations to run for
%       eta: learning rate
    
%   Outputs:
%       w : weight vector
%       e_in : in-sample error (as defined in LFD)
[N, ~] = size(X);

tolerance = 10^-6;

% weight vector from glm method
% w_glm = glmfit(X, y, 'binomial');


% normalization, uncomment to run zscore experiment
X = zscore(X);

% augment X with 1s
X = [ ones(N, 1) X ];

w = w_init;

% replace 0s with -1
y( y == 0 ) = -1;
for t=1:max_its
    sum = 0;
    % calculate gradient
    for n=1:N
        f = ( y(n) .* X(n, :) ) / ( 1 + exp( y(n) .* (w * X(n, :)') ) );
        sum = sum + f;
    end
    gradient = -sum / N;
    if abs(gradient) < tolerance
        break
    end
    v = -gradient;
    
    % update new weight vector (step in direction of steepest descent)
    w = w + (eta * v);
end

sum_E = 0;
% calculate e_in with glm method
% sum_E_glm = 0;
for n=1:N
    sum_E = sum_E + log(1 + exp( -y(n) * ( w * X(n, :)' ) ));
    % calculate e_in with glm method
    % sum_E_glm = sum_E_glm + log(1 + exp( -y(n) * ( w_glm' * X(n, :)' ) ));
end

e_in = sum_E / N;
% print out number of iterations
t

% e_in with glm method
% e_in_glm = sum_E_glm / N
end