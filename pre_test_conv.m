clear;
% a = rand(5,4,3);
% writeNPY(a, 'a.npy');
% b = readNPY('layer0_weight0.npy');
% answ = sum(a(:)==b(:));
% answ
weight=readNPY('layer0_weight0.npy');
bias = readNPY('layer0_weight1.npy');
testx=readNPY('testx.npy');
% testy = readNPY('testy.npy');
% size(weight)
% bias = ones(8,1);
single_weight=weight(:,:,:,1);
weight=cat(4,ones(3,3,3,1),zeros(3,3,3,7));
% size(single_weight)
% single_input=squeeze(testx(1,:,:,:));
single_input=ones(32,32,3);
% a = rand(5,4,3);
% tets=a(1,1,1);
% A=[1 2 3];
% B=[2 2 2];
% A.*B
output=zeros(30,30,8);
calculate_output=0;
% for output_channel=1:8
%     for row = 1:32
%         if row==31
%             for col= 1:32
%                 if col==31
%                     for channel_num=1:3
%                         single_channel=single_input(:,:,channel_num);
%                         single_channel_weight=weight(:,:,channel_num,output_channel);
%        % row==31 col==31                          
%                         input_data=[single_channel(row,col) single_channel(row,col+1) 0;
%                         single_channel(row+1,col) single_channel(row+1,col+1) 0;
%                         0 0 0
%                         ]; 
%                         result_channel=input_data.*single_channel_weight;
%                         calculate_output=sum(sum(result_channel))+calculate_output;
%                         if channel_num==3
%                             output(row,col,output_channel)=calculate_output+bias(output_channel);
%                             calculate_output=0;
%                         end
%                     end
%                 elseif col==32
%                     for channel_num=1:3
%                         single_channel=single_input(:,:,channel_num);
%                         single_channel_weight=weight(:,:,channel_num,output_channel);
%        % row==31 col==32                 
%                         input_data=[single_channel(row,col) 0 0;
%                        single_channel(row+1,col) 0 0;
%                         0 0 0
%                         ];
%                         result_channel=input_data.*single_channel_weight;
%                         calculate_output=sum(sum(result_channel))+calculate_output;
%                         if channel_num==3
%                             output(row,col,output_channel)=calculate_output+bias(output_channel);
%                             calculate_output=0;
%                         end
%                     end
%                 else
%                     for channel_num=1:3
%                         single_channel=single_input(:,:,channel_num);
%                         single_channel_weight=weight(:,:,channel_num,output_channel);
%     % row==31 col==normal                
%                         input_data=[single_channel(row,col) single_channel(row,col+1) single_channel(row,col+2);
%                         single_channel(row+1,col) single_channel(row+1,col+1) single_channel(row+1,col+2);
%                         0 0 0
%                         ]; 
%                         result_channel=input_data.*single_channel_weight;
%                         calculate_output=sum(sum(result_channel))+calculate_output;
%                         if channel_num==3
%                             output(row,col,output_channel)=calculate_output+bias(output_channel);
%                             calculate_output=0;
%                         end
%                     end                
%                 end
%             end
%         elseif row==32
%             for col= 1:32
%                 if col==31
%                     for channel_num=1:3
%                         single_channel=single_input(:,:,channel_num);
%                         single_channel_weight=weight(:,:,channel_num,output_channel);
%     % row==32 col==31                
%                         input_data=[single_channel(row,col) single_channel(row,col+1) 0;
%                         0 0 0;
%                         0 0 0
%                         ];
%                         result_channel=input_data.*single_channel_weight;
%                         calculate_output=sum(sum(result_channel))+calculate_output;
%                         if channel_num==3
%                             output(row,col,output_channel)=calculate_output+bias(output_channel);
%                             calculate_output=0;
%                         end
%                     end
%                 elseif col==32
%                     for channel_num=1:3
%                         single_channel=single_input(:,:,channel_num);
%                         single_channel_weight=weight(:,:,channel_num,output_channel);
%     % row==32 col==32            
%                         input_data=[single_channel(row,col) 0 0;
%                         0 0 0;
%                         0 0 0
%                         ];
%  
%                         result_channel=input_data.*single_channel_weight;
%                         calculate_output=sum(sum(result_channel))+calculate_output;
%                         if channel_num==3
%                             output(row,col,output_channel)=calculate_output+bias(output_channel);
%                             calculate_output=0;
%                         end
%                     end
%                 else
%                     for channel_num=1:3
%                         single_channel=single_input(:,:,channel_num);
%                         single_channel_weight=weight(:,:,channel_num,output_channel);
%         % row==32 col==normal          
%                         input_data=[single_channel(row,col) single_channel(row,col+1) single_channel(row,col+2);
%                         0 0 0;
%                         0 0 0
%                         ];
%   
%                         result_channel=input_data.*single_channel_weight;
%                         calculate_output=sum(sum(result_channel))+calculate_output;
%                         if channel_num==3
%                             output(row,col,output_channel)=calculate_output+bias(output_channel);
%                             calculate_output=0;
%                         end
%                     end                
%                 end
%             end
%         else
% %             row=normal
%             for col= 1:32
%                 if col==31
%                     for channel_num=1:3
%                         single_channel=single_input(:,:,channel_num);
%                         single_channel_weight=weight(:,:,channel_num,output_channel);
%     % col=31               
%                         input_data=[single_channel(row,col) single_channel(row,col+1) 0;
%                         single_channel(row+1,col) single_channel(row+1,col+1) 0;
%                         single_channel(row+2,col) single_channel(row+2,col+1) 0
%                         ];
%                         result_channel=input_data.*single_channel_weight;
%                         calculate_output=sum(sum(result_channel))+calculate_output;
%                         if channel_num==3
% 
%                             output(row,col,output_channel)=calculate_output+bias(output_channel);
%                             calculate_output=0;
%                         end
%                     end
%                 elseif col==32
%                     for channel_num=1:3
%                         single_channel=single_input(:,:,channel_num);
%                         single_channel_weight=weight(:,:,channel_num,output_channel);
%     % col=32                   
%                         input_data=[single_channel(row,col) 0 0;
%                         single_channel(row+1,col) 0 0;
%                         single_channel(row+2,col) 0 0
%                         ];
%                     
%                         result_channel=input_data.*single_channel_weight;
%                         calculate_output=sum(sum(result_channel))+calculate_output;
%                         if channel_num==3
%                             output(row,col,output_channel)=calculate_output+bias(output_channel);
%                             calculate_output=0;
%                         end
%                     end
%                 else
%                     for channel_num=1:3
%                         single_channel=single_input(:,:,channel_num);
%                         single_channel_weight=weight(:,:,channel_num,output_channel);
% % col=normal            
%                         input_data=[single_channel(row,col) single_channel(row,col+1) single_channel(row,col+2);
%                         single_channel(row+1,col) single_channel(row+1,col+1) single_channel(row+1,col+2);
%                         single_channel(row+2,col) single_channel(row+2,col+1) single_channel(row+2,col+2)
%                         ]; 
%                         result_channel=input_data.*single_channel_weight;
%                         calculate_output=sum(sum(result_channel))+calculate_output;
%                         if channel_num==3
%                             output(row,col,output_channel)=calculate_output+bias(output_channel);
%                             calculate_output=0;
%                         end
%                     end                
%                 end
%             end
%         end
%     end
% end
% floor(a/b)
for output_channel=1:8
    for row = 1:30
        for col= 1:30
            for channel_num=1:3
                single_channel=single_input(:,:,channel_num);
                single_channel_weight=weight(:,:,channel_num,output_channel);
    % col=normal            
                input_data=[single_channel(row,col) single_channel(row,col+1) single_channel(row,col+2);
                single_channel(row+1,col) single_channel(row+1,col+1) single_channel(row+1,col+2);
                single_channel(row+2,col) single_channel(row+2,col+1) single_channel(row+2,col+2)
                ]; 
                result_channel=input_data.*single_channel_weight;
                calculate_output=sum(sum(result_channel))+calculate_output;
                if channel_num==3
                    output(row,col,output_channel)=calculate_output+bias(output_channel);
                    calculate_output=0;                       
                end
            end
        end
    end
end




