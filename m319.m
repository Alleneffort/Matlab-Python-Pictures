% ��ʹ��imhist����ֱ��ͼ
% clear all;
% I = imread('1.jpg'); 
% I=rgb2gray(I);  %�ҶȻ�
% %����ֱ��ͼ 
% [m,n]=size(I); 
% GP=zeros(1,256);
% for k=0:255 
%      GP(k+1)=length(find(I==k))/(m*n);  %����ÿ���Ҷȳ��ֵĸ��ʣ��������GP
%  end 
%  
% %����ֱ��ͼ���⻯ 
% S1=zeros(1,256); 
% for i=1:256
%     for j=1:i 
%           S1(i)=GP(j)+S1(i);
%     end 
% end 
% S2=round((S1*256)+0.5); %��Sk�鵽������ĻҶ� 
% for i=1:256 
%     GPeq(i)=sum(GP(find(S2==i)));%��������ÿ���Ҷȼ����ֵĸ��� 
% end 
% figure;
% subplot(221);bar(0:255,GP,'b');  
% title('ԭͼ��ֱ��ͼ') 
%  
% subplot(222);bar(0:255,GPeq,'b') 
% title('���⻯���ֱ��ͼ') 
%  
% X=I;
% for i=0:255
%     X(find(I==i)) = S2(i+1);
% end
%  
% subplot(223);imshow(I);
% title('ԭͼ��') ;
% subplot(224);imshow(X);
% title('ֱ��ͼ������ͼ��');

%%
% ����2-4
% f = imread('Fig0615[original].tif');
% h = imhist(f)
% plot(h)
% axis([0 255 0 15000])
% set(gca,'xtick',[0 50 255]);
% set(gca,'ytick',[0:2000;15000])

% horz = linspace(0,255,25)
% bar(horz,h)
% axis([0 255 0 60000])
% set(gca,'xtick',0:50:255)
% set(gca,'ytick',0:20000:60000)
%%
% ֱ��ͼ2-5
% f = imread('Fig0208(a).tif');
% figure,imshow(f);
% figure,imhist(f)
% ylim('auto')
% g = histeq(f,256);
% figure,imshow(g)
% figure,imhist(g)
% ylim('auto')
% hnorm = imhist(f)./numel(f);
% cdf = cumsum(hnorm);
% x = linspace(0,1,256);
% figure,plot(x,cdf)
% axis([0 1 0 1]);
% set(gca,'xtick',0:.2:1)
% set(gca,'ytick',0:.2:1)
% xlabel('Input intensity value','fontsize',9)
% ylabel('Output intensity value','fontsize',9)
%%
% һ��ʾ������������roihist����
% histroi����ͼ����ROI��ֱ��ͼ��
%[P��NPIX] = histroi��F��C��R������ͼ��F�и���Ȥ�Ķ��������ROI����ֱ��ͼP��
%������������䶥����к������궨�� ��ʸ��C��R�зֱ�ָ����˳��أ���
%F���������ر���> = 0.����NPIX�Ƕ���������е���������
f = imread('068.bmp');
f = rgb2gray(f);     %�����rgbͼ��Ļ�
mask = roipoly(f);
[x1,x2] = find(mask);
[P,NPIX1] = histroi(f,x1,x2);
close all;
%%
mask2 = roipoly(f);
[x3,x4] = find(mask2);
mask3 = mask2 - mask;
[x5,x6] = find(mask3);
[P3,NIPIX3] = histroi(f,x5,x6);
close all;
%%
% a=imread('');
% [m,n]=size(a);
% c=ones(m,n)-a;
% imshow(c);
%%
%����ͼ��
figure,plot(P)
hold on
plot(P3)
xlim([100 180]);
%%
%���Ƴ���Ŀ�������ͼ
figure,imshow(f);
nn = im2bw(mask);figure,imshow(nn);title('Ŀ������');
mm = im2bw(mask3);figure,imshow(mm);title('��Ŀ������ͼ')
%%







