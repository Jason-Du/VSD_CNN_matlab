clear;
% weight=readNPY('layer0_weight0.npy');
% bias = readNPY('layer0_weight1.npy');
% testx=readNPY('testx.npy');
weight=cat(4,ones(3,3,3,1),zeros(3,3,3,5),ones(3,3,3,2));
bias=ones(8,1);
% size(single_weight)
% single_input=squeeze(testx(1,:,:,:));
single_input=ones(32,32,3);
output=conv_layer(single_input,weight,bias);