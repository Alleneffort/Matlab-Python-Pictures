% ʵ�ָ����������ȡ,��֪����roi����Ķ�ֵͼ����ԭͼ��Ҫ�õ�roi���������ֵ��
I = imread('img.png');
L = imread('label.png');
I2 = rgb2gray(I);
G=zeros(512,512);
G(:,:,1)=L;
M = uint8(G).*(I2);
H(:,:,1)=M;H(:,:,2)=M;H(:,:,3)=M;
imshow(H)
