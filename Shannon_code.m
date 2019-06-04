function Y=Shannon_code(pa)
% n=8;
% pa=rand(1,n);
% pa=[0.20,0.19,0.18,0.17,0.15,0.10,0.01];
pa=pa/sum(pa);
pa=pa;
k=length(pa);       %计算信源符号个数
for i=1:k-1      %for循环进行降序排列
    for n=i+1:k
        if (pa(i)<pa(n))
                t=pa(i);
                pa(i)=pa(n);
                pa(n)=t;    
        end
    end
end
% disp('信源分布概率从大到小为：'),disp(pa)
 y=0;%给y赋初值，用来求概率和
 f=0;%给f赋初值，用来得到子程序最大循环次数
s=zeros(k,1);   %对求和结果进行矩阵初始化
b=zeros(k,1);   %对编码位数矩阵初始化
w=zeros(k,1);  %对二进制矩阵初始化
for m=1:k       %进行香农编码
    s(m)=y;
    y=y+pa(m);
    b(m)=ceil(-log2(pa(m)));%求得的自信息量向上取整，得到码字长度
    z=zeros(b(m),1);    %对码字矩阵初始化
    x=s(m);
    f=max(b(m));   %把码字最大长度赋给f，用于进行十进制转二进制
    w=dtob(x,f);    %调用子程序将十进制转换为二进制
    for r=1:b(m)
        z(r)=w(r);
    end
%    disp('输出结果为：');
%    disp('初始概率'),disp(pa(m))
%    disp('求和结果'),disp(s(m))
%    disp('编码位数'),disp(b(m))
%     disp('最终编码'),disp(z')
   
end
sum0=0;
sum1=0;
for i=1:k       %使用for循环进行信息熵、平均码长求解
    a(i)=-log2(pa(i));  %a(i)表示单个信源的自信息量
    K(i)=ceil(a(i));   %K(i)表示对自信息量向上取整
    R(i)=pa(i)*K(i);
    sum0=sum0+R(i);  %求平均码长
    c(i)=a(i)*pa(i);
    sum1=sum1+c(i);  %信息熵
end
K1=sum0;
H=sum1;
Y=H/K1;   %用Y来表示编码效率
% disp(['信息熵H(X)=',num2str(H),'(bit/sign)']); 
% disp(['平均码长K=',num2str(K1),'(bit/sign)']);
% fprintf('香农编码编码效率为')
% disp(Y)  
