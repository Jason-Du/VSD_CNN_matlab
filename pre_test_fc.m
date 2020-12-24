clear;
input_data=rand(400,1);
weight=readNPY('layer7_weight0.npy');
bias = readNPY('layer7_weight1.npy');
weight_size=size(weight);
output_data=zeros(weight_size(2),1);
% for output_num=1:weight_size(2)
%     W=weight(:,output_num);
%     output_data(output_num)=W*(input_data.')+bias(output_num);
% end
% output_data=fc_layer(input_data,weight,bias);
W=weight(:,1);
B=input_data.';
result=W*(input_data.');
A=[1 2 3]
B=[1 2 3]
A*B.'