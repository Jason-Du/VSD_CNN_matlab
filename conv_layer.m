function [output] = conv_layer(single_input,weight,bias)
%CONV_LAYER Summary of this function goes here
%   Detailed explanation goes here
    single_input_size=size(single_input);
    weight_size=size(weight);
    output_row=single_input_size(1)-2;
    output_col=single_input_size(2)-2;
    output=zeros(output_row,output_col,weight_size(4));
    calculate_output=0;
    wordlength=16;
    fra=10;
    Q.mode = 'fixed'; 
    Q.roundmode = 'floor'; 
    Q.format = [wordlength fra]; 
    q = quantizer(Q);
    for output_channel=1:weight_size(4)
        for row = 1:output_row
            for col= 1:output_col
                for channel_num=1:single_input_size(3)
                    single_channel=single_input(:,:,channel_num);
                    single_channel_weight=weight(:,:,channel_num,output_channel);
                    
        % col=normal            
                    input_data=[single_channel(row,col) single_channel(row,col+1) single_channel(row,col+2);
                    single_channel(row+1,col) single_channel(row+1,col+1) single_channel(row+1,col+2);
                    single_channel(row+2,col) single_channel(row+2,col+1) single_channel(row+2,col+2)
                    ]; 
                    result_channel=quantize(q,input_data.*single_channel_weight);
%                     result_channel=input_data.*single_channel_weight;
                    tmp=calculate_output;
                    calculate_output=quantize(q,sum(sum(result_channel))+tmp);
%                     calculate_output=sum(sum(result_channel))+tmp;
                    if channel_num==single_input_size(3)
                        output(row,col,output_channel)=quantize(q,calculate_output+bias(output_channel));
%                         output(row,col,output_channel)=calculate_output+bias(output_channel);
                        calculate_output=0;    
                    end
                end
            end
        end
    end
end

%     for output_channel=1:weight_size(4)
%         for row = 1:single_input_size(1)
%             if row==single_input_size(1)-1
%                 for col= 1:single_input_size(2)
%                     if col==single_input_size(2)-1
%                         for channel_num=1:single_input_size(3)
%                             single_channel=single_input(:,:,channel_num);
%                             single_channel_weight=weight(:,:,channel_num,output_channel);
%            % row==31 col==31                          
%                             input_data=[single_channel(row,col) single_channel(row,col+1) 0;
%                             single_channel(row+1,col) single_channel(row+1,col+1) 0;
%                             0 0 0
%                             ]; 
%                             result_channel=input_data.*single_channel_weight;
%                             calculate_output=sum(sum(result_channel))+calculate_output;
%                             if channel_num==3
%                                 output(row,col,output_channel)=calculate_output+bias(output_channel);
%                                 calculate_output=0;
%                             end
%                         end
%                     elseif col==single_input_size(2)
%                         for channel_num=1:single_input_size(3)
%                             single_channel=single_input(:,:,channel_num);
%                             single_channel_weight=weight(:,:,channel_num,output_channel);
%            % row==31 col==32                 
%                             input_data=[single_channel(row,col) 0 0;
%                            single_channel(row+1,col) 0 0;
%                             0 0 0
%                             ];
%                             result_channel=input_data.*single_channel_weight;
%                             calculate_output=sum(sum(result_channel))+calculate_output;
%                             if channel_num==3
%                                 output(row,col,output_channel)=calculate_output+bias(output_channel);
%                                 calculate_output=0;
%                             end
%                         end
%                     else
%                         for channel_num=1:single_input_size(3)
%                             single_channel=single_input(:,:,channel_num);
%                             single_channel_weight=weight(:,:,channel_num,output_channel);
%         % row==31 col==normal                
%                             input_data=[single_channel(row,col) single_channel(row,col+1) single_channel(row,col+2);
%                             single_channel(row+1,col) single_channel(row+1,col+1) single_channel(row+1,col+2);
%                             0 0 0
%                             ]; 
%                             result_channel=input_data.*single_channel_weight;
%                             calculate_output=sum(sum(result_channel))+calculate_output;
%                             if channel_num==3
%                                 output(row,col,output_channel)=calculate_output+bias(output_channel);
%                                 calculate_output=0;
%                             end
%                         end                
%                     end
%                 end
%             elseif row==single_input_size(1)
%                 for col= 1:single_input_size(2)
%                     if col==single_input_size(2)-1
%                         for channel_num=1:single_input_size(3)
%                             single_channel=single_input(:,:,channel_num);
%                             single_channel_weight=weight(:,:,channel_num,output_channel);
%         % row==32 col==31                
%                             input_data=[single_channel(row,col) single_channel(row,col+1) 0;
%                             0 0 0;
%                             0 0 0
%                             ];
%                             result_channel=input_data.*single_channel_weight;
%                             calculate_output=sum(sum(result_channel))+calculate_output;
%                             if channel_num==3
%                                 output(row,col,output_channel)=calculate_output+bias(output_channel);
%                                 calculate_output=0;
%                             end
%                         end
%                     elseif col==single_input_size(2)
%                         for channel_num=1:single_input_size(3)
%                             single_channel=single_input(:,:,channel_num);
%                             single_channel_weight=weight(:,:,channel_num,output_channel);
%         % row==32 col==32            
%                             input_data=[single_channel(row,col) 0 0;
%                             0 0 0;
%                             0 0 0
%                             ];
% 
%                             result_channel=input_data.*single_channel_weight;
%                             calculate_output=sum(sum(result_channel))+calculate_output;
%                             if channel_num==3
%                                 output(row,col,output_channel)=calculate_output+bias(output_channel);
%                                 calculate_output=0;
%                             end
%                         end
%                     else
%                         for channel_num=1:single_input_size(3)
%                             single_channel=single_input(:,:,channel_num);
%                             single_channel_weight=weight(:,:,channel_num,output_channel);
%             % row==32 col==normal          
%                             input_data=[single_channel(row,col) single_channel(row,col+1) single_channel(row,col+2);
%                             0 0 0;
%                             0 0 0
%                             ];
% 
%                             result_channel=input_data.*single_channel_weight;
%                             calculate_output=sum(sum(result_channel))+calculate_output;
%                             if channel_num==3
%                                 output(row,col,output_channel)=calculate_output+bias(output_channel);
%                                 calculate_output=0;
%                             end
%                         end                
%                     end
%                 end
%             else
%     %             row=normal
%                 for col= 1:single_input_size(2)
%                     if col==single_input_size(2)-1
%                         for channel_num=1:single_input_size(3)
%                             single_channel=single_input(:,:,channel_num);
%                             single_channel_weight=weight(:,:,channel_num,output_channel);
%         % col=31               
%                             input_data=[single_channel(row,col) single_channel(row,col+1) 0;
%                             single_channel(row+1,col) single_channel(row+1,col+1) 0;
%                             single_channel(row+2,col) single_channel(row+2,col+1) 0
%                             ];
%                             result_channel=input_data.*single_channel_weight;
%                             calculate_output=sum(sum(result_channel))+calculate_output;
%                             if channel_num==3
% 
%                                 output(row,col,output_channel)=calculate_output+bias(output_channel);
%                                 calculate_output=0;
%                             end
%                         end
%                     elseif col==single_input_size(2)
%                         for channel_num=1:single_input_size(3)
%                             single_channel=single_input(:,:,channel_num);
%                             single_channel_weight=weight(:,:,channel_num,output_channel);
%         % col=32                   
%                             input_data=[single_channel(row,col) 0 0;
%                             single_channel(row+1,col) 0 0;
%                             single_channel(row+2,col) 0 0
%                             ];
% 
%                             result_channel=input_data.*single_channel_weight;
%                             calculate_output=sum(sum(result_channel))+calculate_output;
%                             if channel_num==3
%                                 output(row,col,output_channel)=calculate_output+bias(output_channel);
%                                 calculate_output=0;
%                             end
%                         end
%                     else
%                         for channel_num=1:single_input_size(3)
%                             single_channel=single_input(:,:,channel_num);
%                             single_channel_weight=weight(:,:,channel_num,output_channel);
%     % col=normal            
%                             input_data=[single_channel(row,col) single_channel(row,col+1) single_channel(row,col+2);
%                             single_channel(row+1,col) single_channel(row+1,col+1) single_channel(row+1,col+2);
%                             single_channel(row+2,col) single_channel(row+2,col+1) single_channel(row+2,col+2)
%                             ]; 
%                             result_channel=input_data.*single_channel_weight;
%                             calculate_output=sum(sum(result_channel))+calculate_output;
%                             if channel_num==3
%                                 output(row,col,output_channel)=calculate_output+bias(output_channel);
%                                 calculate_output=0;
%                             end
%                         end                
%                     end
%                 end
%             end
%         end
%     end
% end