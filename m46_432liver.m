% ���´���ʵ�ָβ���mask֮���һЩ����������ÿһ���������Ƕ����ģ�����Ҫ�Ŀ���ע�͵�
% ע��·�����ļ��ĺ�׺
% 2018-04-06 @lilin
tic;
imgPath = 'E:\�β�����\�ڶ���Matlab���β�_432��\001\';%ԭʼͼƬλ��
imgDir  = dir([imgPath '*.bmp']);                   %��������png��ʽ�ļ�
imgPath2 = 'E:\�β�����\�ڶ���Matlab���β�_432��\002\';%ԭʼ��ǩλ��
imgDir2  = dir([imgPath2 '*.png']);                   %��������png��ʽ�ļ�
% ����·��
imgPath3 = 'E:\�β�����\�ڶ���Matlab���β�_432��\003\';%�������ͼƬ����λ��1
imgPath4 = 'E:\�β�����\�ڶ���Matlab���β�_432��\004\';%�������ͼƬ����λ��2
imgPath5 = 'E:\�β�����\�ڶ���Matlab���β�_432��\005\';%�������ͼƬ����λ��3
imgPath6 = 'E:\�β�����\�ڶ���Matlab���β�_432��\006\';%�������ͼƬ����λ��4

for i = 1:length(imgDir)
    I = imread([imgPath imgDir(i).name]);
    J = imread([imgPath2 imgDir2(i).name]);
    [m,n,~] = size(I);
    % ���δ���ʵ��ȥ��CT���ܵĸ�����Ϣ----------------1
    I1 = zeros(m,n);
    for m1 = 1:m
        for n1 = 1:n
            if I(m1,n1,1)~=I(m1,n1,2)||I(m1,n1,1)~=I(m1,n1,3)||I(m1,n1,2)~=I(m1,n1,3)
                I1(m1,n1) =I1(m1,n1); 
            else
                I1(m1,n1) = I(m1,n1);
            end
        end
    end
    I1 = uint8(cat(3,I1,I1,I1));
    new_name1 = imgDir(i).name(1:end-4);
    new_name_1 = strcat(new_name1,'.png');
    imwrite(I1,strcat(imgPath3,new_name_1));%��ԭ����CT���ֱ���ͼƬ����·����imgPath3
    %%
    % ���δ���ʵ�ֽ��β���ԭʼͼƬ��ȡ����--------------2
    I2 = zeros(m,n);
    for m3 = 1:m
        for n3 = 1:n
            if J(m3,n3) == 0
                I2(m3,n3) = I2(m3,n3);
            else
                I2(m3,n3) = I(m3,n3);
            end
        end
    end
    I2 = uint8(cat(3,I2,I2,I2));
    new_name2 = imgDir(i).name(1:end-4);
    new_name_2 = strcat(new_name2,'.png');
    imwrite(I2,strcat(imgPath4,new_name_2));%�Ժͱ�ǩһ�������ֱ���ͼƬ����·����imgPath4
    %%
    % ���δ���ʵ��ͼƬ����ת--------------------------3
    % ע�������漰����ԭʼͼƬ�Ĳ�����ע��ͱ�ǩһһ��Ӧ��
    % ����ת�ǲ��ı��С����ת���ü������
    % ���������ת����ȥ��������Ϣ��CT�������е� I ��Ϊ I1
    I3 = imrotate(I,45,'bilinear','crop'); %��ʱ����ת45��
    J3 = imrotate(J,45,'bilinear','crop');  %��ʱ����ת45��
    new_name31 = imgDir(i).name(1:end-4);
    new_name_31 = strcat(new_name31,'.png');
    imwrite(I3,strcat(imgPath5,new_name_31));
    imwrite(J3,strcat(imgPath6,new_name_31));
    %%
    %���δ���ʵ��Ť������-----------------------------4
    
end
clc;clear;close all;
toc

