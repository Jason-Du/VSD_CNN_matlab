function [output_data] = fc_layer(input_data,weight,bias)
%FC_LAYER Summary of this function goes here
%   Detailed explanation goes here
    weight_size=size(weight);
    output_data=zeros(weight_size(2),1);
    wordlength=16;
    fra=10;
    Q.mode = 'fixed'; 
    Q.roundmode = 'floor'; 
    Q.format = [wordlength fra]; 
    q = quantizer(Q);
    for output_num=1:weight_size(2)
        W=weight(:,output_num);
%         output_data(output_num)=(input_data.')*W+bias(output_num);
        output_data(output_num)=quantize(q,(input_data.')*W+bias(output_num));
    end
end
% for output_num=1:weight_size(2)
%     W=weight(:,output_num);
%     output_data(output_num)=(input_data.')*W+bias(output_num);
% end
