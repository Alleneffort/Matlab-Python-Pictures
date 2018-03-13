% ��11.2
f = imread('Fig1103(a).tif');
% f = imread('77.bmp');
% f = rgb2gray(f);
h = fspecial('average',9);
g = imfilter(f,h,'replicate');
gB = im2bw(g,0.55);

figure,imshow(f);title('ԭʼͼƬ');
figure,imshow(g);title('9x9ƽ�����ͼ��');
figure,imshow(gB);title('��ֵ��������ͼƬ');
%��ȡgB��߽�
B = bwboundaries(gB,'noholes');
%����ֻ����ı߽��й�
d = cellfun('length',B);
[maxd,k] = max(d);
b = B{k};

[M N] = size(g);
g = bound2im(b,M,N);
figure,imshow(g);title('��ֵͼ��ı߽�');
%%
[s,su] = bsubsamp(b,50);
g2 = bound2im(s,M,N);
figure,imshow(g2);title('��ȡ���߽�');
%%
cn = connectpoly(s(:,1),s(:,2));
g3 = bound2im(cn,M,N);
figure,imshow(g3);title('���ӵ��Ӳ���');
%%
c = fchcode(su);
clear
clc