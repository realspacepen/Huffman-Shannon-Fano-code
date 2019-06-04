function b=huffman_code(c)
%霍夫曼编码
%huffman_code
% n=8;
% c=[];
% c=rand(1,n);%********随机生成数据********************
% c=[0.350,0.300,0.200,0.100,0.040,0.005,0.005];
% c=c/sum(c);
p=c;
w=[;];%***************位置矩阵，记录数据的变化过程*****
n=length(p);
for i=1:n-1
    [p,l]=sort(p);
    w(i,:)=[l(1:n-i+1),zeros(1,i-1)];
    p=[p(1)+p(2),p(3:n),1];
end
a={;};%**********字符数组，生成霍夫曼码****************
for i=1;2*(n-1);
    for j=1:n
        a{i,j}=' ';
    end
end%*****************初始化*********************
a{2*n-2,1}='0';
a{2*n-2,2}='1';
for i=1:n-1
    for j=1:i+1
        a{2*(n-i)-1,j}=a{2*(n-i),w(n-i,:)==j};
    end
    if((n-i-1)<=0)
        break;
    end
    a{2*(n-i-1),1}=strcat(a{2*(n-i)-1,1},'0');
    a{2*(n-i-1),2}=strcat(a{2*(n-i)-1,1},'1');
    for j=3:i+2
        a{2*(n-i-1),j}=a{2*(n-i)-1,j-1};
    end
end  
h=-c.*log2(c);
hx=sum(h);
for i=1:n
    len(i)=length(a{1,i});
end
plen=len.*c;
averagelen=sum(plen);
% fprintf('霍夫曼编码为:\n');
% disp(a);
% for i=1:n
%     disp(a(1,i));
% end
% fprintf('平均码长为:\n');
% disp(averagelen);
% fprintf('信源熵为:\n');
% disp(hx);
% fprintf('霍夫曼编码效率为')
b=hx/averagelen;
