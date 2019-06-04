clc;
clear all;
h=ones(1,100);
s=ones(1,100);
f=ones(1,100);
h_all=0;
s_all=0;
f_all=0;
for i =1:100
    [f(i),s(i),h(i)]=test3(8);
    h_all=h_all+h(i);
    s_all=s_all+s(i);
    f_all=f_all+f(i);
end
h_average=h_all/100;
s_average=s_all/100;
f_average=f_all/100;
figure(1)
plot(f,'r');
hold on;
plot(s,'g');
hold on;
plot(h,'b');

