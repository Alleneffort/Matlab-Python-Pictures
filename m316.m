% �򵥵�ʹ�����ͺ͸�ʴ
% ����9.2
% A = imread('Fig0906(a).tif');
% B = [0 1 0;1 1 1;0 1 0]; %�ṹԪ����
% D = imdilate(A,B);
% figure,
% subplot(121);
% imshow(A)
% title('A')
% subplot(122);
% imshow(D);
% title('D');
%%
% ����9.3
% A = imread('Fig0908(a).tif');
% se = strel('disk',10);
% E10 = imerode(A,se);
% figure,subplot(221)
% imshow(A)
% subplot(222);
% imshow(E10);
% 
% se2 = strel('disk',5);
% E5 = imerode(A,se);
% subplot(223);
% imshow(E5)
% 
% E20 = imerode(A,strel('disk',20));
% subplot(224);
% imshow(E20);

%%
% ����9.5
% f = imread('Fig0913(a).tif');
% B1 = strel([0 0 0;0 1 1;0 1 0]);
% B2 = strel([1 1 1;1 0 0;1 0 0]);
% g = bwhitmiss(f,B1,B2);
% subplot(121);
% imshow(f)
% subplot(122)
% imshow(g);
%%
% ����934
% f = imread('Fig0911(c).tif');
% ginf1 = bwmorph(f,'thin',1);
% ginf2 = bwmorph(f,'thin',2);
% ginf = bwmorph(f,'thin',Inf);
% subplot(231)
% imshow(ginf1);title('һ��ϸ��');
% subplot(232);
% imshow(ginf2);title('����ϸ��');
% subplot(233);
% imshow(ginf);title('һֱ���ȶ���ϸ��');
%
% f2 = imread('Fig0916(a).tif');
% fs = bwmorph(f2,'skel',Inf);
% subplot(234);
% imshow(f2);title('ԭʼͼƬ');
% for k =1:5
%     fs =fs&~endpoints(fs);
% end
% subplot(235);
% imshow(fs);title('ʹ��bwmorph���')
% fs2 = bwmorph(fs,'spur',5);
% figure,imshow(fs2);x
%%
% ����9.7,�ҵ�ÿһ�����ģ�����ǳ���
% f = imread('Fig0917(a).tif');
% [L,n] = bwlabel(f);
% imshow(f);
% hold on;
% for k =1:n
%     [r,c] = find(L == k);
%     rbar = mean(r);
%     cbar = mean(c);
%     plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k',...
%         'MarkerFaceColor','k','MarkerSize',10);
%     plot(cbar,rbar,'Marker','*','MarkerEdgeColor','W');
% end

%%
% ���� 9.8 �ؽ�
% f = imread('Fig0922(a).tif');
% fe = imerode(f,ones(51,1));
% 
% fo = imopen(f,ones(51,1));
% fobr = imreconstruct(fe,f);
% g = imfill(f,'holes');
% g2 = imclearborder(f,4);
% 
% subplot(321)
% imshow(f);title('ԭͼ')
% subplot(322)
% imshow(fo);title('���߿�����');
% subplot(323)
% imshow(fobr);title('�����ؽ�������')
% subplot(324)
% imshow(g);title('���׶�');
% subplot(325)
% imshow(g2);title('����߽�');
% figure,imshow(g2)
%%
% ����9-6�Ҷȼ�������͸�ʴ

% f = imread('068.bmp');
% se = strel('square',3);
% gd = imdilate(f,se);
% ge = imerode(f,se);
% morph_grah = gd-ge;
% figure,imshow(f)
% figure,imshow(gd)
% figure,imshow(ge)
% figure,imshow(morph_grah)

%%
%����9-9 �������ͱղ�������̬ѧƽ��
% f = imread('Fig0925(a).tif');
% se = strel('disk',5);
% fo = imopen(f,se);
% foc = imclose(fo,se);
% 
% figure,imshow(f)
% fasf =f;
% for k =2:5
%     se = strel('disk',k);
%     fasf = imclose(imopen(fasf,se),se);
%     figure,imshow(fasf);
% end

%%
% ����9-10���Ǿ��ȱ��� �Ĳ���
% f = imread('Fig0926(a).tif');
% se = strel('disk',10);
% fo = imopen(f,se);
% figure,imshow(fo);%������
% f2 = f-fo;
% f2 = imtophat(f2,se);
% figure,imshow(f2); %��ֵ������Ч��
% 
% se = strel('disk',3);
% g = f+imtophat(f,se) - imbothat(f,se);
% figure,imshow(g);
%%
% ����9-11 ���ȵĲⶨ
% f = imread('Fig0925(a).tif');
% sumpixels = zeros(1,36);
% for k =0:35
%     se = strel('disk',k);
%     fo = imopen(f,se);
%     sumpixels(k+1) = sum(fo(:));
% end
% plot(0:35,sumpixels),xlabel('k'),ylabel('Surface area')
% figure
% plot(-diff(sumpixels));
% xlabel('k');
% ylabel('Surface area reduction')
% 
% %%
% se = strel('disk',5);
% f = imclose(f,se);
% sumpixels = zeros(1,36);
% for k =0:35
%     se = strel('disk',k);
%     fo = imopen(f,se);
%     sumpixels(k+1) = sum(fo(:));
% end
% figure
% plot(-diff(sumpixels));
% xlabel('k');
% ylabel('Surface area reduction')
%%
% �ؽ� 9-6-3
% f = imread('Fig0925(a).tif');
% se = strel('disk',4);
% fe = imerode(f,se);
% fobr = imreconstruct(fe,f);
% 
% fobrc = imcomplement(fobr);
% fobrce = imerode(fobrc,se);
% fobrcbr = imcomplement(imreconstruct(fobrce,fobrc));
% 
% figure,imshow(f);
% figure,imshow(fobr);
% figure,imshow(fobrcbr)

%%
% % ����9-12 �Ƴ����ӵı���
% f = imread('Fig0930(a).tif');
% figure,imshow(f);
% 
% f_obr = imreconstruct(imerode(f,ones(1,7)),f);
% f_o = imopen(f,ones(1,71));
% figure,imshow(f_o);
% 
% f_thr = f - f_obr;
% f_th = f- f_o;
% figure,imshow(f_th);
% 
% g_obr = imreconstruct(imerode(f_thr,ones(1,11)),f_thr);
% figure,imshow(g_obr);
% 
% g_obrd = imdilate(g_obr,ones(1,21));
% f2 = imreconstruct(min(g_obrd,f_thr),f_thr);
% figure,imshow(f2);
%%


