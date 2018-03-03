% 2018-03-03
% ��ȡͼƬ���Ҷ�ֵ������
img = imread('0000.bmp');
figure,imshow(img);
img = im2bw(img);%��ͼ��ָת��Ϊ��ֵͼ
img = not(img);%��ͼ����������ݱ��1
figure,imshow(img);


% ʹ��bwboundaries������ʾĿ��ı߽�
[B,L] = bwboundaries(img);
figure,imshow(img);
hold on;
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2),boundary(:,1),'g','LineWidth',2);
end

%ʹ��bwlabel��ǲ���ͼ���е���������α��ɫ�����ǣ�Ȼ�������ǵı����ʾ����
[L,N] = bwlabel(img);
img_rgb = label2rgb(L,'hsv',[.5 .5 .5],'shuffle');
figure,imshow(img_rgb);hold on
for k =1:length(B)
    boundary = B{k};
    plot(boundary(:,2),boundary(:,1),'w','LineWidth',2);
    text(boundary(1,2)-11,boundary(1,1)+11,num2str(k),'Color','y','Fontsize',14,'FontWeight','bold');
end

%���ú���regionprops������ͼ���е�ÿ��Ŀ����ȡ����Ķ�������
% Area�������,Centroid�����ģ�,Eccentricity��ƫ���ʣ�,Perimeter���ܳ���
stats = regionprops(L,'all');%ͳ�Ƶ���������stats��
temp = zeros(1,N);
for k = 1:N
    %����thinness ratio��ϸ�ȱ�����
    temp(k) = 4 * pi * stats(k,1).Area / (stats(k,1).Perimeter)^2;
    stats(k,1).ThinnessRatio = temp(k);
    %����aspect ratio
    temp(k) = (stats(k,1).BoundingBox(3))/(stats(k,1).BoundingBox(4));
    stats(k,1).AspectRatio = temp(k);
end

% �������ϸ�ȱ���Ϊ����������ʸ��ͼ������������
areas = zeros(1,N);
for k = 1:N
    areas(k) = stats(k).Area;
end
TR = zeros(1,N);

for k = 1: N
    TR(k) = stats(k).ThinnessRatio;
end
cmap = colormap(lines(21));
figure
for k = 1:N
    scatter(areas(k),TR(k),[],cmap(k,:),'filled');
    ylabel('Thinness Ratio'),xlabel('Area');
    hold on
end

