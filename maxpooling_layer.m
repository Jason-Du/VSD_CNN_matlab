function [output_data] = maxpooling_layer(input_data,stride)
%MAXPOOLING_LAYER Summary of this function goes here
%   Detailed explanation goes here
% input_data=cat(1,ones(15,32,3),ones(7,32,3)+2,ones(8,32,3));

% pool_size=[2 2];
input_data_size=size(input_data);
output_data=zeros(floor(input_data_size(1)/2),floor(input_data_size(2)/2),input_data_size(3));
% stride=[2,2];
for row =1:stride(1):input_data_size(1)
    for col=1:stride(2):input_data_size(2)
        for channel_num=1:input_data_size(3)
            single_channel_compare_array=[input_data(row,col,channel_num) input_data(row,col+1,channel_num);
                input_data(row+1,col,channel_num) input_data(row+1,col+1,channel_num)];
            output_data(floor(row/stride(1))+1,floor(col/stride(2))+1,channel_num)=max(max( single_channel_compare_array));
        end
    end
end
% for row =1:stride(1):input_data_size(1)
%     if row==input_data_size(1)-1
%         for col=1:stride(2):input_data_size(2)
%             if col==input_data_size(2)-1
%                 for channel_num=1:input_data_size(3)
%                     single_channel_compare_array=[input_data(row,col,channel_num) input_data(row,col+1,channel_num) 0 ;
%                         input_data(row+1,col,channel_num) input_data(row+1,col+1,channel_num) 0;
%                         0 0 0];
%                     output_data(floor(row/2)+1,floor(col/2)+1,channel_num)=max(max( single_channel_compare_array));
%                 end
%             elseif col==input_data_size(2)
%                 
%                 for channel_num=1:input_data_size(3)
%                     single_channel_compare_array=[input_data(row,col,channel_num) 0 0;
%                         input_data(row+1,col,channel_num) 0 0;
%                         0 0 0];
%                     output_data(floor(row/2)+1,floor(col/2)+1,channel_num)=max(max( single_channel_compare_array));
%                 end
%             else
%                 for channel_num=1:input_data_size(3)
%                     single_channel_compare_array=[input_data(row,col,channel_num) input_data(row,col+1,channel_num) input_data(row,col+2,channel_num) ;
%                         input_data(row+1,col,channel_num) input_data(row+1,col+1,channel_num) input_data(row+1,col+2,channel_num);
%                         0 0 0];
%                     output_data(floor(row/2)+1,floor(col/2)+1,channel_num)=max(max( single_channel_compare_array));
%                 end
%             end
%         end
%     elseif row==input_data_size(1)
%         for col=1:stride(2):input_data_size(2)
%             if col==input_data_size(2)-1
%                 
%                 for channel_num=1:input_data_size(3)
%                     single_channel_compare_array=[input_data(row,col,channel_num) input_data(row,col+1,channel_num) 0 ;
%                         0 0 0;
%                         0 0 0];
%                     output_data(floor(row/2)+1,floor(col/2)+1,channel_num)=max(max( single_channel_compare_array));
%                 end
%             elseif col==input_data_size(2)
%                 
%                 for channel_num=1:input_data_size(3)
%                     single_channel_compare_array=[input_data(row,col,channel_num) 0 0;
%                         0 0 0;
%                         0 0 0];
%                     output_data(floor(row/2)+1,floor(col/2)+1,channel_num)=max(max( single_channel_compare_array));
%                 end
%             else
%                 for channel_num=1:input_data_size(3)
%                     single_channel_compare_array=[input_data(row,col,channel_num) input_data(row,col+1,channel_num) input_data(row,col+2,channel_num) ;
%                         0 0 0;
%                         0 0 0];
%                     output_data(floor(row/2)+1,floor(col/2)+1,channel_num)=max(max( single_channel_compare_array));
%                 end
%             end
%         end
%     else
%         for col=1:stride(2):input_data_size(2)
%             if col==input_data_size(2)-1
%                 
%                 for channel_num=1:input_data_size(3)
%                     single_channel_compare_array=[input_data(row,col,channel_num) input_data(row,col+1,channel_num) 0 ;
%                         input_data(row+1,col,channel_num) input_data(row+1,col+1,channel_num) 0;
%                         input_data(row+2,col,channel_num) input_data(row+1,col+1,channel_num) 0];
%                     output_data(floor(row/2)+1,floor(col/2)+1,channel_num)=max(max( single_channel_compare_array));
%                 end
%             elseif col==input_data_size(2)
%                 
%                 for channel_num=1:input_data_size(3)
%                     single_channel_compare_array=[input_data(row,col,channel_num) 0 0;
%                         input_data(row+1,col,channel_num) 0 0;
%                         input_data(row+2,col,channel_num) 0 0];
%                     output_data(floor(row/2)+1,floor(col/2)+1,channel_num)=max(max( single_channel_compare_array));
%                 end
%             else
%                 for channel_num=1:input_data_size(3)
%                     single_channel_compare_array=[input_data(row,col,channel_num) input_data(row,col+1,channel_num) input_data(row,col+2,channel_num) ;
%                         input_data(row+1,col,channel_num) input_data(row+1,col+1,channel_num) input_data(row+1,col+2,channel_num);
%                         input_data(row+2,col,channel_num) input_data(row+1,col+1,channel_num) input_data(row+2,col+2,channel_num)];
%                     output_data(floor(row/2)+1,floor(col/2)+1,channel_num)=max(max( single_channel_compare_array));
%                 end
%             end
%         end
%     end
% end
end

