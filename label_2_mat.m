clc   
clear   
% im=imread('C:\Users\Administrator\Desktop\1.png');   
dirction='D:\���ݼ�\3Dircadb\�½��ļ���\liver256_2_8bit';   
Path=dir(fullfile(dirction,'*.png'));   
for k=1:numel(Path)   
    imPath=fullfile(dirction,Path(k).name);   
    im=imread(imPath);     
    [row col]=size(im);                        %ͼƬ�ĳߴ�   
    bd=cell(1,33);   
    bd(:)={logical(sparse(row,col))};  %��һ��Ԫ��������Ԥ��33��ȫ��ϡ����󣬱���0����   
    N=unique(im);                              %ͼƬ�ֳɶ�����   
    if N(1)==0                                 %�ų���������   
        N=N(2:numel(N),1);   
    end   
    for i=1:numel(N)   
        [x y]=find(im==N(i));                  %�ҵ�ͼƬ�б��Ϊһ�����������   
        flog=1;   
        for t=1:numel(x)   
            if ((x(t)-1)==0)||((y(t)-1)==0)||((x(t)+1)>row)||((y(t)+1)>col)                         %�ҵ��߽��ߵ㣬�ų���  
                continue;   
            else   
                if (im(x(t)-1,y(t))~= N(i))||(im(x(t)+1,y(t))~= N(i))||(im(x(t),y(t)-1)~= N(i))||(im(x(t),y(t)+1)~= N(i)) %�ҵ�һ��ͼ���ϵı߿��  
                    X(flog)=x(t);   
                    Y(flog)=y(t);   
                    flog=flog+1;   
                end   
            end   
        end   
        val=zeros(row,col);                         %��������ͼ���С��ȫ�����   
        val((Y-1)*row+X)=1;                         %����һ��ͼ��ĵı߿����ȫ�����   
        bd(N(i))={logical(sparse(val))};    %���������ͼ��߿�ľ�����ϡ�����ķ�ʽ����Ԫ�������Ӧ�ı߿������   
        X=zeros(0);Y=zeros(0);                      % X,Y������㴦�������´����´洢����   
    end   
    GTcls.Boundaries=bd;   
    GTcls.Segmentation=im;   
    GTcls.CategoriesPresent=N';   
    save_path=fullfile('D:\���ݼ�\3Dircadb\�½��ļ���\liver256_2_8bit_mat',strcat(Path(k).name(1:5),'.mat'));  
    save(save_path,'GTcls');   
 end  