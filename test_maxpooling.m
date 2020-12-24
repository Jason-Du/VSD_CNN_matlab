clear;
input_data=cat(1,ones(17,32,3),ones(7,32,3)+2,ones(8,32,3));
% output_data=zeros(16,16,3);
pool_size=[2 2];
input_data_size=size(input_data);
stride=[2,2];
output_data=maxpooling_layer(input_data,stride);