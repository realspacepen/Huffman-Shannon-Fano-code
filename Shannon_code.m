function Y=Shannon_code(pa)
% n=8;
% pa=rand(1,n);
% pa=[0.20,0.19,0.18,0.17,0.15,0.10,0.01];
pa=pa/sum(pa);
pa=pa;
k=length(pa);       %������Դ���Ÿ���
for i=1:k-1      %forѭ�����н�������
    for n=i+1:k
        if (pa(i)<pa(n))
                t=pa(i);
                pa(i)=pa(n);
                pa(n)=t;    
        end
    end
end
% disp('��Դ�ֲ����ʴӴ�СΪ��'),disp(pa)
 y=0;%��y����ֵ����������ʺ�
 f=0;%��f����ֵ�������õ��ӳ������ѭ������
s=zeros(k,1);   %����ͽ�����о����ʼ��
b=zeros(k,1);   %�Ա���λ�������ʼ��
w=zeros(k,1);  %�Զ����ƾ����ʼ��
for m=1:k       %������ũ����
    s(m)=y;
    y=y+pa(m);
    b(m)=ceil(-log2(pa(m)));%��õ�����Ϣ������ȡ�����õ����ֳ���
    z=zeros(b(m),1);    %�����־����ʼ��
    x=s(m);
    f=max(b(m));   %��������󳤶ȸ���f�����ڽ���ʮ����ת������
    w=dtob(x,f);    %�����ӳ���ʮ����ת��Ϊ������
    for r=1:b(m)
        z(r)=w(r);
    end
%    disp('������Ϊ��');
%    disp('��ʼ����'),disp(pa(m))
%    disp('��ͽ��'),disp(s(m))
%    disp('����λ��'),disp(b(m))
%     disp('���ձ���'),disp(z')
   
end
sum0=0;
sum1=0;
for i=1:k       %ʹ��forѭ��������Ϣ�ء�ƽ���볤���
    a(i)=-log2(pa(i));  %a(i)��ʾ������Դ������Ϣ��
    K(i)=ceil(a(i));   %K(i)��ʾ������Ϣ������ȡ��
    R(i)=pa(i)*K(i);
    sum0=sum0+R(i);  %��ƽ���볤
    c(i)=a(i)*pa(i);
    sum1=sum1+c(i);  %��Ϣ��
end
K1=sum0;
H=sum1;
Y=H/K1;   %��Y����ʾ����Ч��
% disp(['��Ϣ��H(X)=',num2str(H),'(bit/sign)']); 
% disp(['ƽ���볤K=',num2str(K1),'(bit/sign)']);
% fprintf('��ũ�������Ч��Ϊ')
% disp(Y)  
