% ԭʼ�ķ�ʽ������1
tic
MAX_CNT = 1000000;
for i=1:MAX_CNT
    x(i) = i^2;
end
toc
%%
% ���ٷ�ʽ1
tic
MAX_CNT2 = 1000000;
X = zeros(1,MAX_CNT2);
for i=1:MAX_CNT2
    x(i)=i^2;
end
toc
%%
% ���ٷ�ʽ2
tic
MAX_CNT3 = 1000000;
i = 1:MAX_CNT;
x = i.^2;
toc
%% ����2
% ԭʼ�ķ�ʽ
tic
i = 0;
for t = 0:pi/4:2*pi
    i = i+1;
    x1(i) = sin(t);
end
toc
%%
% ���ٷ�ʽ
tic
t1 = 0:pi/4:2*pi;
x2 = sin(t1);
toc
%%

