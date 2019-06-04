function t=fano_code(x,ind,C)
k=length(x);
if length(x)<=1
    t=C;
else
    for i=1:length(x)-1
        if abs(sum(x(1:i))-(sum(x(:)))/2)<abs(sum(x(1:i+1))-(sum(x(:)))/2)
            break;
        end
    end
    for i1=1:i
        C{ind(i1)}=strcat(C{ind(i1)},'1');
    end
    for i2=i+1:length(x)
        C{ind(i2)}=strcat(C{ind(i2)},'0');
    end
    x1=x(1:i);
    x2=x(i+1:end);
    ind1=ind(1:i);
    ind2=ind(i+1:end);
    C=fano_code(x1,ind1,C);
    C=fano_code(x2,ind2,C);
    t=C;
end
end
