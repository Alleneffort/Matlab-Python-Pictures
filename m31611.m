%% m431 ���
% fsq = imread('Fig1116(a).tif');
% bSq = bwboundaries(fsq,'noholes');%�����Ȼ�ȡ�߽�����
% [distSq,angleSq] = signature(bSq{1});
% plot(angleSq,distSq)
%%
% ���� 11.6 ��������Ĺ���
% f = imread('Fig1113(a).tif');
% h = fspecial('gaussian',[2 5],5);
% g = imfilter(f,h,'replicate');
% figure,imshow(g);
% g = uint8(g);
% g = im2bw(g,0.5*graythresh(g));
% figure,imshow(g);
% s = bwmorph(g,'skel',Inf);
% s1 = bwmorph(s,'spur',8);
% figure,imshow(s1);
%%
% f = imread('Fig1116(a).tif');
% b = bwboundaries(f,'noholes');
% b = b{1};
% bim = bound2im(b,size(f,1),size(f,2));
% figure,imshow(bim);
% 
% z = frdescp(b);
% s546 = ifrdescp(z,546);
% s546im = bound2im(s546,size(f,1),size(f,2));
% figure,imshow(s546im);
%%
% ����11-11
f2 = imread('Fig1124(b).tif');
G2 = graycomatrix(f2,'NumLevels',256);
G2n = G2/sum(G2(:));
stats2 = graycoprops(G2,'all');

maxProbability2 = max(G2n(:));
contrast2 = stats2.Contrast;
corr2 = stats2.Correlation;
energy2 = stats2.Energy;
hom2 = stats2.Homogeneity;
for I=1:size(G2n,1);
    sumcols(I)=sum(-G2n(I,1:end).*log2(G2n(I,1:end)+eps));
end

entropy2 =sum(sumcols);
    


 



