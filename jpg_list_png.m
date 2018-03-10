%% ��ͼƬ��ɫ
imgPath = 'D:\��ʱ�ļ�\zui\';        % ͼ���·��
imgDir  = dir([imgPath '*.png']); % ��������jpg��ʽ�ļ�
for i = 1:length(imgDir)          % �����ṹ��Ϳ���һһ����ͼƬ��
    I = imread([imgPath imgDir(i).name]); %��ȡÿ��ͼƬ
    I_gray=rgb2gray(I);
    I_bw=uint8(im2bw(I_gray))*128;
    I1=uint8(zeros(size(I,1),size(I,2),3));
    I1(:,:,1)=I_bw;
    [x,map]=rgb2ind(I1,256);
    imgSaveName=imgDir(i).name(1:length(imgDir(i).name)-4);
    imwrite(x,map,strcat(imgSaveName,'.png'));
end
%%
% foldername = dir('liver_01_liver');% ���ڵó��������ļ��е�����
% for i=1:length(foldername)-2
%     filename=strcat('liver_01_liver\',foldername(i+2).name);% ��ȡ���ļ��е����ֺ�·��
%     % filename=dir('liver_01_liver');
%     imgname=dir(strcat(filename,'\*.jpg'));% ��ȡ���ļ���ͼƬ��bmp��ʽ
%     I=imread(imgname);% ��ȡͼƬ
%     
%     %I=imread(imgname);
%     I_gray=rgb2gray(I);
%     I_bw=uint8(im2bw(I_gray))*128;
%     I1=uint8(zeros(size(I,1),size(I,2),3));
%     I1(:,:,1)=I_bw;
%     [x,map]=rgb2ind(I1,256);
%     imgSaveName=imgname(1:length(imgname)-4);
%     imwrite(x,map,strcat(imgSaveName,'.png'));
%     %save('���·��\����.mat',imagedata);
% end