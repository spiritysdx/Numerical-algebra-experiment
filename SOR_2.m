A=[-4 1 1 1;1 -4 1 1;1 1 -4 1;1 1 1 -4];
b=[1 1 1 1]';
x0=[0 0 0 0]';
times=9;
w=1.3;
[M, x]=SOR(A,b,x0,times,w);
function [M,x]=SOR(A,b,x0,times,w)
%[M,x]=SOR(A,b,x0,times,w)
%
%MΪjacobi��������
%xΪ������Ľ�
%AΪϵ������
%bΪ�����Ҳ�
%timesΪ��������
%x0Ϊ��ʼx0
%wΪ��������
D=diag(diag(A));
L=D-tril(A);
U=D-triu(A);
M=(D-w.*L)\((1-w).*D+w.*U);
if vrho(M)>=1     %��B����
    error('jacobi��������������');
end
i=1;
while i<=times
    x=M*x0+(D-w.*L)\(w.*b);    %��������
    x0=x;
    disp(['��',num2str(i),'��']);
    disp(x);
    i=i+1;
end
end
