n=4;
a=[0 -1 -1 -1];
b=[5 5 5 5];
c=[-1 -1 -1 0];
x=[1 2 3 4];%��ų�����
s=zeros(n,1);
t=s;
temp=0;
for k=1:n
    s(k)=b(k)-a(k)*temp;%temp�����t[k-1],t[-1]����0
    t(k)=c(k)/s(k);
    temp=t(k);
end
temp=0;
for k=1:n
    x(k)=(x(k)-a(k)*temp)/s(k);   %x[k]�д�ŵ���y[k]
    temp=x(k);                    %temp�����y[k-1],y[-1]����0
end
for k=n-1:-1:1
    x(k)=x(k)-t(k)*x(k+1);
end
fprintf('\nx=\n');
for k=1:n
  fprintf('%f\n',x(k));
end