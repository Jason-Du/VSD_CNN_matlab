clear;
wordlength=16;
fra=10;
Q.mode = 'fixed'; 
Q.roundmode = 'floor'; 
Q.format = [wordlength fra]; 
q = quantizer(Q);
conv2d_1_weight=readNPY('layer0_weight0.npy');
conv2d_1_bias = readNPY('layer0_weight1.npy');
conv2d_2_weight=readNPY('layer1_weight0.npy');
conv2d_2_bias=readNPY('layer1_weight1.npy');
conv2d_3_weight=readNPY('layer3_weight0.npy');
conv2d_3_bias=readNPY('layer3_weight1.npy');
conv2d_4_weight=readNPY('layer4_weight0.npy');
conv2d_4_bias=readNPY('layer4_weight1.npy');
dense_1_weight=readNPY('layer7_weight0.npy');
dense_1_bias=readNPY('layer7_weight1.npy');
testx=readNPY('testx.npy');
testy=readNPY('testy.npy');
conv2d_1_weight=quantize(q,conv2d_1_weight);
conv2d_1_bias=quantize(q,conv2d_1_bias);
conv2d_2_weight=quantize(q,conv2d_2_weight);
conv2d_2_bias=quantize(q,conv2d_2_bias);
conv2d_3_weight=quantize(q,conv2d_3_weight);
conv2d_3_bias=quantize(q,conv2d_3_bias);
conv2d_4_weight=quantize(q,conv2d_4_weight);
conv2d_4_bias=quantize(q,conv2d_4_bias);
dense_1_weight=quantize(q,dense_1_weight);
dense_1_bias=quantize(q,dense_1_bias);
testx=quantize(q,testx);
testy=quantize(q,testy);
% # conv2d_1
% # conv2d_2
% # max_pooling2d_1
% # conv2d_3
% # conv2d_4
% # max_pooling2d_2
% # flatten_1
% # dense_1
test_data_size=size(testx);
% % conv1_data=conv_layer(testx,conv2d_1_weight,conv2d_1_bias);
correct=0;
for test_data_num=1:1000
    fprintf('%d data is predicting\n',test_data_num);
    data_test=squeeze(testx(test_data_num,:,:,:));
%     data_test=ones(32,32,3);
    conv1_data=conv_layer(data_test,conv2d_1_weight,conv2d_1_bias);
    conv1_data_act=relu_activation(conv1_data);
    conv2_data=conv_layer(conv1_data_act,conv2d_2_weight,conv2d_2_bias);
    conv2_data_act=relu_activation(conv2_data);
    maxpool1_data= maxpooling_layer(conv2_data_act,[2,2]);
    conv3_data=conv_layer(maxpool1_data,conv2d_3_weight,conv2d_3_bias);
    conv3_data_act=relu_activation(conv3_data);
    conv4_data=conv_layer(conv3_data_act,conv2d_4_weight,conv2d_4_bias);
    conv4_data_act=relu_activation(conv4_data);
    maxpool2_data= maxpooling_layer(conv4_data_act,[2,2]);
    flatten_data= flatten_layer(maxpool2_data);
    fc1_data= fc_layer(flatten_data,dense_1_weight,dense_1_bias);
    [VALUE,LABEL] = max(fc1_data);
%     LABEL
%     testy(test_data_num)
    if LABEL==testy(test_data_num)+1
        correct=correct+1;
    end
     accuracy=(correct/test_data_num)*100;
     fprintf('accuracy is %d  \n',accuracy);
end