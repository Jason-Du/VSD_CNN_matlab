function [output] = relu_activation(A)
%RELU_ACTIVATION Summary of this function goes here
%   Detailed explanation goes here
logical_matrix= (A >= 0); %which entries should activate neurons
logical_matrix=double(logical_matrix);
output = A.*logical_matrix;
end

