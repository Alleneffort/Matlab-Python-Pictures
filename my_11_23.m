%�β�����汾V1.2
%2017.11.21
%lilin
%
str1='D:\coco\01\';%ԭʼ��ͼ֡����ļ���
str2='D:\coco\0001\001\';%��ȡ��ͼ������ͼ�����

k=1;
for h=1:33
    image=imread([str1,num2str(h),'.bmp']);
    I1=imcrop(image,[40,85,279,249]);
    [height,width]=size(I1);
    for i=1:height
        for j=1:width
            if(I1(i,j)<=150&&I1(i,j)>=40)
                I1(i,j)=I1(i,j)-40;
            else
                I1(i,j)=I1(i,j);
            end
        end
    end
    imwrite(I1,[str2,num2str(k),'.jpg']);
    k=k+1;
end

