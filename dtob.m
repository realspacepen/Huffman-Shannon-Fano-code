function y=dtob(x,f)
for i=1:f
    temp=x.*2;
    if(temp<1)
        y(i)=0;
        x=temp;
    else
        x=temp-1;
        y(i)=1;
    end
end