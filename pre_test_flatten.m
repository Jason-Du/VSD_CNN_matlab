clear;
input_data=rand([8,8,3]);
input_data_size=size(input_data);
output_data=zeros(input_data_size(1)*input_data_size(2)*input_data_size(3),1);
i=1;
% for row=1:input_data_size(1)
%     for col=1:input_data_size(2)
%         for channel=1:input_data_size(3)
%             output_data(i)=input_data(row,col,channel);
%             i=i+1;
%         end
%     end
% end

output_data=flatten_layer(input_data);