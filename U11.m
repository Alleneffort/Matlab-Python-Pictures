f = imread('001.jpg');
f = rgb2gray(f);     %�����rgbͼ��Ļ�
mask = roipoly(f);
g = bwperim(mask,8);
[x1,x2] = find(g);
[P,NPIX1] = histroi(f,x1,x2);
plot(P)
saveas(gca,'test2.jpg');
close all;