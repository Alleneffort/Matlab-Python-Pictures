f=imread('09.jpg');
g_f=rgb2gray(f);
f2=logical(g_f);

[L,num]=bwlabel(f2,8); % L��һ����䣬ͬһ��������ͬһ��ֵ��䣬num����ͬ������������������4��ͨ��
g=bwperim(f2,8);%  g�Ǳ߽�Ԫ�أ��߽�Ϊ1���Ǳ߽�Ϊ0

B=bwboundaries(f2,8); %��ȡ�߽����꣬�߽����ͬ�ԣ�4��ͨ��
[b,l,nr,a]=bwboundaries(f2,8);

clc