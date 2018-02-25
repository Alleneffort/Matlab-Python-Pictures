
imgPath1 = 'D:/���-CT/20180121������ת�Ȳ���/�����ձ�ǩ��ԭʼCT/';
save1 = 'D:/���-CT/20180121������ת�Ȳ���/ԭʼCT/ˮƽ����/';
save2 = 'D:/���-CT/20180121������ת�Ȳ���/ԭʼCT/��ֱ����/';
save3 = 'D:/���-CT/20180121������ת�Ȳ���/ԭʼCT/��תͼ��/';
imgDir1 = dir([imgPath1 '*.bmp']);
for i = 1:length(imgDir1)
    A = imread([imgPath1 imgDir1(i).name]);
    [height,width,dim]=size(A);  
    tform=maketform('affine',[-1 0 0;0 1 0;width 0 1]);  
    B=imtransform(A,tform,'nearest');%B�д洢���Ǿ���ˮƽ����任���ͼ��  
    tform2=maketform('affine',[1 0 0;0 -1 0;0 height 1]);  
    C=imtransform(A,tform2,'nearest');%C�д洢���Ǿ�����ֱ����任���ͼ�� 
    D = imrotate(A,90);              % D�б������ͼ�����ת���
    imwrite(B,strcat(save1,num2str(i),'sp.bmp'));
    imwrite(C,strcat(save2,num2str(i),'cz.bmp'));
    imwrite(D,strcat(save3,num2str(i),'xz.bmp'));
end