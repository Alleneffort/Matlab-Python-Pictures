%% 
imgPath = 'C:\Users\lilin\Documents\MATLAB\img_test\fdz-p-70\';  % CTͼ���·��
imgDir  = dir([imgPath '*.jpg']); % �������иø�ʽ�ļ�
imgPath2 = 'C:\Users\lilin\Documents\MATLAB\img_test\01\';       %��ǩ·��
imgDir2  = dir([imgPath2 '*.jpg']);

% ����λ��
imgPath3 = 'C:\Users\lilin\Documents\MATLAB\img_test\02\'; % ԭʼͼƬ�������ͼƬλ��
imgPath4 = 'C:\Users\lilin\Documents\MATLAB\img_test\03\'; % ��Ӧ�ı�ǩ������Ĵ��λ��

for i = 1:length(imgDir)
    I = imread([imgPath imgDir(i).name]);   % ԭʼͼƬ
    J = imread([imgPath2 imgDir2(i).name]); % ��Ӧ�ı�ǩͼƬ
    
    I_rot35 = imrotate(I,35,'bilinear','crop');% ���ı��С����ת
    J_rot35 = imrotate(J,35,'bilinear','crop');% ���ı��С����ת
    I_rot135 = imrotate(I,-35,'bilinear','crop');% ���ı��С����ת
    J_rot135 = imrotate(J,-35,'bilinear','crop');% ���ı��С����ת
    
    I_sp = flipdim(I,2);%���Ҿ���
    J_sp = flipdim(J,2);%���Ҿ���
    I_sp2 = flipdim(I,1);%���¾���
    J_sp2 = flipdim(J,1);%���¾���
    
    % ƽ��
    se_I1 = translate(strel(1), [50 50]);I_2 = imdilate(I,se_I1);
    se_J1 = translate(strel(1), [50 50]);J_2 = imdilate(J,se_J1);
    se_I2 = translate(strel(1), [-50 -50]);I_3 = imdilate(I,se_I2);
    se_J2 = translate(strel(1), [-50 50]);J_3 = imdilate(J,se_J2);
    %%
    % ֱ��ͼ���⻯
    I_hes1 = adapthisteq(rgb2gray(I));
    I_hes = cat(3,I_hes1,I_hes1,I_hes1);
    new_I_rot = imgDir(i).name(1:end-4);
    new_name22 = strcat(new_I_rot,'_adh1_.png');
    
    imwrite(I_hes,strcat(imgPath3,new_name22));
    imwrite(J,strcat(imgPath4,new_name22));
    %%
    
    new_I_rot35 = imgDir(i).name(1:end-4);
    I_rot35_name = strcat(new_I_rot35,'_ro1_.png');
    J_rot35_name = strcat(new_I_rot35,'_ro1_.png');
    
    I_rot135_name = strcat(new_I_rot35,'_ro2_.png');
    J_rot135_name = strcat(new_I_rot35,'_ro2_.png');
    
    I_sp_na = strcat(new_I_rot35,'_mi1_.png');
    J_sp_na = strcat(new_I_rot35,'_mi1_.png');
    
    I_sp_na2 = strcat(new_I_rot35,'_mi2_.png');
    J_sp_na2 = strcat(new_I_rot35,'_mi2_.png');
    
    I_mo1 = strcat(new_I_rot35,'_mo1_.png');
    J_mo1 = strcat(new_I_rot35,'_mo1_.png');
    
    I_mo2 = strcat(new_I_rot35,'_mo2_.png');
    J_mo2 = strcat(new_I_rot35,'_mo2_.png');    
    
    imwrite(I_rot35,strcat(imgPath3,I_rot35_name));
    imwrite(J_rot35,strcat(imgPath4,J_rot35_name));
 
    imwrite(I_rot135,strcat(imgPath3,I_rot135_name));
    imwrite(J_rot135,strcat(imgPath4,J_rot135_name));
    
    imwrite(I_sp,strcat(imgPath3,I_sp_na));
    imwrite(J_sp,strcat(imgPath4,J_sp_na));
    
    imwrite(I_sp2,strcat(imgPath3,I_sp_na2));
    imwrite(J_sp2,strcat(imgPath4,J_sp_na2));
    
    imwrite(I_2,strcat(imgPath3,I_mo1));
    imwrite(J_2,strcat(imgPath4,J_mo1));
    
    imwrite(I_3,strcat(imgPath3,I_mo2));
    imwrite(J_3,strcat(imgPath4,J_mo2));   
    
    % ��ԭͼ������Ŀ���ļ���
    name23 = imgDir(i).name(1:end-4);
    name_n = strcat(name23,'.png');
    imwrite(I,strcat(imgPath3,name_n));
    imwrite(J,strcat(imgPath4,name_n));
end